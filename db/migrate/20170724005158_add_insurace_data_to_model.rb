class AddInsuraceDataToModel < ActiveRecord::Migration[5.0]
  def change
    add_column :cars_insurance_requests, :brand, :string
    add_column :cars_insurance_requests, :model, :string
    add_column :cars_insurance_requests, :year, :string
    add_column :cars_insurance_requests, :value, :string
    add_column :cars_insurance_requests, :driver_license, :string
    add_column :cars_insurance_requests, :vehicle_registration, :string
  end
end
