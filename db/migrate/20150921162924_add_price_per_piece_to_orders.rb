class AddPricePerPieceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :price_per_piece, :integer
  end
end
