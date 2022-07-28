# frozen_string_literal: true

class CartsController < DashboardController
  def show
    @cart = authorize Cart.find(params[:id])
    @line_items = @cart.line_items
  end
end
