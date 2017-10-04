class AddCirInfoToRequest < ActiveRecord::Migration[5.0]
  def change
  	add_column :insurance_requests, :cir_brand, :string
  	add_column :insurance_requests, :cir_model, :string
  	add_column :insurance_requests, :cir_year, :string
  	add_column :insurance_requests, :cir_price, :string
  end
end
