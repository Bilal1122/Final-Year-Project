class AddImageToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :image, :string
  end
end
