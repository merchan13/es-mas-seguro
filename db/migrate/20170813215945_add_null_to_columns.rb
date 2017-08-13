class AddNullToColumns < ActiveRecord::Migration[5.0]
  def change
    change_column_null :insurance_requests, :phone, false
    change_column_null :insurance_requests, :email, false
    change_column_null :insurance_requests, :contact_via, false
  end
end
