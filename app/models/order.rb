# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart

  def total_price
    cart.line_items.to_a.sum(&:price)
  end
end
