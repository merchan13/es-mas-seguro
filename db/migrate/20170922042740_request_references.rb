class RequestReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :insurance_requests, :rating, foreign_key: true
  end
end
