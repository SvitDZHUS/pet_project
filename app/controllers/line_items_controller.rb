# frozen_string_literal: true

class LineItemsController < ApplicationController
  def add_item_to_cart
    @book = Book.find(params[:book_id])
    current_user.cart.line_items.create!(book_id: @book.id, price: @book.price)
    flash[:notice] = t('.controller.add_item_to_cart')
    redirect_to current_user.cart
  end

  def move_item_to_shelf
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:notice] = t('.controller.remove_item_from_cart')
    redirect_to current_user.cart
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:notice] = t('.controller.remove_item_from_cart')
    redirect_to current_user.cart
  end
end
