class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :email, :string
    add_column :orders, :phn_number, :string
    add_column :orders, :nric, :string
    add_column :orders, :company_name, :string
    add_column :orders, :address, :string
    add_column :orders, :quantity, :string
    add_column :orders, :sizing, :string
    add_column :orders, :fabric_type, :string
    add_column :orders, :delivery_date, :string
  end
end
