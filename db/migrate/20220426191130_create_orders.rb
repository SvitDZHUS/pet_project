class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :cart
      t.boolean :paid, default: false
      t.string :token
      t.decimal :price
      t.timestamps
    end
  end
end
