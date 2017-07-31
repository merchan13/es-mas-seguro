module LifeWizard
  module LifeInsuranceRequest
    STEPS = %w(step1 step2 step3).freeze

    class Base
      include ActiveModel::Model
      attr_accessor :lir

      delegate *::LifeInsuranceRequest.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :lir

      def initialize(cir_attributes)
        @cir = ::LifeInsuranceRequest.new(lir_attributes)
      end
    end

    class Step1 < Base
    end

    class Step2 < Step1
    end

    class Step3 < Step2
    end
  end
end
