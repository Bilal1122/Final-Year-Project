class AddAdminToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :admin, :boolean
  end
end
