class InsuranceRequest < ApplicationRecord
  validates :name, presence: true
  validates :contact_via, presence: true
  validates :insurance_type, presence: true
end
