class CreateRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :insurance_requests, :contact_via, :string
  end
end
