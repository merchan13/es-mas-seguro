class CreateCarInsuranceRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :car_insurance_requests do |t|

      t.timestamps
    end
  end
end
