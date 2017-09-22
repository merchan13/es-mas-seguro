class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.string :calification,       null: false
      t.string :message

      t.references :insurance_requests, foreign_key: true
      
      t.timestamps
    end
  end
end
