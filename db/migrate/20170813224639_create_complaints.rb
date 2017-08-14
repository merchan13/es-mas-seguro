class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.string :policy_number,      null: false
      t.string :name,               null: false
      t.string :phone,              null: false
      t.string :email,              null: false
      t.text :message,              null: false

      t.timestamps
    end
  end
end
