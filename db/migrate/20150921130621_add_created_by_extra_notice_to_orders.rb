class AddCreatedByExtraNoticeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :created_by_id, :integer
    add_column :orders, :created_by_name, :string
    add_column :orders, :extra_note, :text
  end
end
