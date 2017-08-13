class NewRequestColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :insurance_requests, :email, :string
    add_column :insurance_requests, :phone, :string
  end
end
