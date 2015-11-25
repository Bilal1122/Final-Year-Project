class AddImage1ToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :image1, :string
  end
end
