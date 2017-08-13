class DropCarsInsuranceRequests < ActiveRecord::Migration[5.0]
  def change
    drop_table :cars_insurance_requests
    drop_table :car_insurance_requests
  end
end
