# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :lineable, polymorphic: true
  belongs_to :book
end
