class Rating < ApplicationRecord
  validates :calification,  presence: true

  belongs_to :insurance_request
end
