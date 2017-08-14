class InsuranceRequest < ApplicationRecord
  validates :insurance_type,  presence: true
  validates :name,            presence: true
  validates :email,           presence: true
  validates :phone,           presence: true
  validates :contact_via,     presence: true
end
