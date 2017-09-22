class FixRatingReferences < ActiveRecord::Migration[5.0]
  def change
    remove_column :ratings, :insurance_requests_id, :integer
    add_reference :ratings, :insurance_request, foreign_key: true
  end
end
