class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer_name

      t.timestamps null: false
    end
  end
end
