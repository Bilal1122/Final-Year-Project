class AddStatusToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :status, :string
  end
end
