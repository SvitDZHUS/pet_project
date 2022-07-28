# frozen_string_literal: true

class AddAuthorToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :author, :string
  end
end
