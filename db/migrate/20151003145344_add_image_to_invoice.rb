class AddImageToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :image, :string
  end
end
