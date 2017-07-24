module Wizard
  module CarsInsuranceRequest
    STEPS = %w(step1 step2 step3).freeze

    class Base
      include ActiveModel::Model
      attr_accessor :cir

      delegate *::CarsInsuranceRequest.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :cir

      def initialize(cir_attributes)
        @cir = ::CarsInsuranceRequest.new(cir_attributes)
      end
    end

    class Step1 < Base
      validates :full_name, presence: true
      validates :address, presence: true
      validates :phone_number, presence: true
      validates :email, presence: true, format: { with: /@/ }
      validates :id_card, presence: true
      validates :country, presence: true
    end

    class Step2 < Step1
      validates :car_brand, presence: true
      validates :car_model, presence: true
      validates :car_year, presence: true
      validates :car_value, presence: true
    end

    class Step3 < Step2
      validates :id_card_img, presence: true
      validates :driver_license, presence: true
      validates :vehicle_registration, presence: true
    end
  end
end
