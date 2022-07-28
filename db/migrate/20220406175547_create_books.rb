# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :publishing_house
      t.date :publishing_date
      t.string :cover
      t.string :language

      t.timestamps
    end
  end
end
