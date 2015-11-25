class CreateGatepasses < ActiveRecord::Migration
  def change
    create_table :gatepasses do |t|
      t.integer :order_id
      t.string :to_who
      t.string :delivered_pcs
      t.string :total_amount
      t.integer :made_by

      t.timestamps null: false
    end
  end
end
