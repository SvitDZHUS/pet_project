# frozen_string_literal: true

class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :paypal_init

  def new; end

  def create_order
    @order = Order.new
    @order.cart = current_user.cart
    price = @order.cart.total_price.to_s
    request = PayPalCheckoutSdk::Orders::OrdersCreateRequest.new
    request.request_body({
                           intent: 'CAPTURE',
                           purchase_units: [
                             {
                               amount: {
                                 currency_code: 'USD',
                                 value: price
                               }
                             }
                           ]
                         })

    begin
      response = @client.execute(request)
      @order.token = response.result.id
      @order.price = price.to_i
      render json: { token: response.result.id }, status: :ok if @order.save
    rescue PayPalHttp::HttpError
      # HANDLE THE ERROR
    end
  end

  def capture_order
    request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest.new(params[:order_id])
    begin
      response = @client.execute(request)
      @order = Order.find_by(token: params[:order_id])
      @order.paid = response.result.status == 'COMPLETED'
      if @order.save
        render json: { status: response.result.status }, status: :ok
        move_bought_items
      end
    rescue PayPalHttp::HttpError
      # HANDLE THE ERROR
    end
  end

  private

  def paypal_init
    client_id = ENV['PAYPAL_CLIENT_ID']
    client_secret = ENV['PAYPAL_CLIENT_SECRET']
    environment = PayPal::SandboxEnvironment.new(client_id, client_secret)
    @client = PayPal::PayPalHttpClient.new(environment)
  end

  def move_bought_items
    current_user.cart.line_items.each do |line_item|
      line_item.update(lineable_id: current_user.shelf.id, lineable_type: 'Shelf')
    end
  end
end
