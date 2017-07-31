class CarsInsuranceRequest < ApplicationRecord
  mount_uploader :id_card_img, CirDocumentUploader
  mount_uploader :driver_license, CirDocumentUploader
  mount_uploader :vehicle_registration, CirDocumentUploader

  validates_integrity_of  :id_card_img
  validates_processing_of :id_card_img

  validates_integrity_of  :driver_license
  validates_processing_of :driver_license

  validates_integrity_of  :vehicle_registration
  validates_processing_of :vehicle_registration

  validates :full_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :id_card, presence: true
  validates :country, presence: true
  validates :id_card_img, presence: true
  validates :car_brand, presence: true
  validates :car_model, presence: true
  validates :car_year, presence: true
  validates :car_value, presence: true
  validates :driver_license, presence: true
  validates :vehicle_registration, presence: true
end
