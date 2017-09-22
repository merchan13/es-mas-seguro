class AddRateTokenToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :insurance_requests, :token, :string
    add_column :insurance_requests, :token_expired, :boolean
  end
end
