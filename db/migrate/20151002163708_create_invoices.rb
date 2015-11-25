class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :personname
      t.string :invoice_type
      t.text :amount
      t.text :description

      t.timestamps null: false
    end
  end
end
