# frozen_string_literal: true

class Shelf < ApplicationRecord
  include OwnedBy
  has_many :line_items, as: :lineable
  has_many :books, through: :line_items
end
