class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :accessory_name
      t.integer :accessory_quantity
      t.integer :accessory_price_per_pcs
      t.integer :used_accessory
      t.datetime :last_updated
      t.integer :added_by
      t.text :description

      t.timestamps null: false
    end
  end
end
