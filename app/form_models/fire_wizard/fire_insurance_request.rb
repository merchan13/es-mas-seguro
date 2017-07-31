module FireWizard
  module FireInsuranceRequest
    STEPS = %w(step1 step2 step3).freeze

    class Base
      include ActiveModel::Model
      attr_accessor :fir

      delegate *::FireInsuranceRequest.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :fir

      def initialize(cir_attributes)
        @cir = ::FireInsuranceRequest.new(fir_attributes)
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
