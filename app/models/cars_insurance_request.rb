class CarsInsuranceRequest < ApplicationRecord
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
