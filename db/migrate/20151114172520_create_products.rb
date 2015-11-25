class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :status
      t.string :gender
      t.string :price
      t.text :description
      t.string :quantity
      t.string :product_image
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
