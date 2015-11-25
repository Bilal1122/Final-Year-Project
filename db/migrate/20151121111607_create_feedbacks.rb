class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :added_by_id
      t.string :added_by_name
      t.string :subject
      t.text :feedback

      t.timestamps null: false
    end
  end
end
