class CreateCarsInsuranceRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :cars_insurance_requests do |t|
      t.string :full_name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :id_card
      t.string :country
      t.string :id_card_img

      t.timestamps
    end
  end
end
