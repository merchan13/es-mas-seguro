class AddBirthday < ActiveRecord::Migration[5.0]
  def change
  	add_column :insurance_requests, :birthday, :string
  end
end
