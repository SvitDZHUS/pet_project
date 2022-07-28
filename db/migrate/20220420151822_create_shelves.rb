# frozen_string_literal: true

class CreateShelves < ActiveRecord::Migration[7.0]
  def change
    create_table :shelves do |t|
      t.references :owned_by, null: false
      t.timestamps
    end
  end
end
