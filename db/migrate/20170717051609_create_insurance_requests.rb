class CreateInsuranceRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :insurance_requests do |t|
      t.string :name,             null: false
      t.string :insurance_type,   null: false
      t.text :message,            null: false

      t.timestamps
    end
  end
end
