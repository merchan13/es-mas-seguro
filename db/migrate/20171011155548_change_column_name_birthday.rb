class ChangeColumnNameBirthday < ActiveRecord::Migration[5.0]
  def change
  	rename_column :insurance_requests, :birthday, :age
  end
end
