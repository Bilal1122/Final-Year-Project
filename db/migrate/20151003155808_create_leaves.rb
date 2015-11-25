class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.integer :person_id
      t.string :person_name
      t.datetime :from_when
      t.string :number_of_days
      t.string :subject
      t.text :description
      t.string :status, default: "pending"

      t.timestamps null: false
    end
  end
end
