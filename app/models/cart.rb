# frozen_string_literal: true

class Cart < ApplicationRecord
  include OwnedBy
  has_many :line_items, as: :lineable
  has_many :orders

  def total_price
    line_items.to_a.sum(&:price)
  end
end
