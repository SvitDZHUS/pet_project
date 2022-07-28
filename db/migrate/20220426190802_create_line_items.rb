# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.decimal :price
      t.references :lineable, polymorphic: true
      t.belongs_to :book
      t.timestamps
    end
  end
end
