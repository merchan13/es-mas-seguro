class RenameCirColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :cars_insurance_requests, :brand,  :car_brand
    rename_column :cars_insurance_requests, :model,  :car_model
    rename_column :cars_insurance_requests, :year,   :car_year
    rename_column :cars_insurance_requests, :value,  :car_value
  end
end
