class WizardsController < ApplicationController
  before_action :load_cir_wizard, except: %i(validate_step)

  def validate_step
    current_step = params[:current_step]

    @cir_wizard = wizard_cir_for_step(current_step)
    @cir_wizard.cir.attributes = cir_wizard_params
    session[:cir_attributes] = @cir_wizard.cir.attributes

    if @cir_wizard.valid?
      next_step = wizard_cir_next_step(current_step)
      create and return unless next_step

      redirect_to action: next_step
    else
      render current_step
    end
  end

  def create
    if @cir_wizard.cir.save
      session[:cir_attributes] = nil

      RequestNotifierMailer.send_request_email(@cir_wizard).deliver
      
      redirect_to root_path, notice: 'Cars Insurance Request succesfully created!'
    else
      redirect_to({ action: Wizard::CarsInsuranceRequest::STEPS.first }, alert: 'There were a problem when creating the insurance request.')
    end
  end

  private

  def load_cir_wizard
    @cir_wizard = wizard_cir_for_step(action_name)
  end

  def wizard_cir_next_step(step)
    Wizard::CarsInsuranceRequest::STEPS[Wizard::CarsInsuranceRequest::STEPS.index(step) + 1]
  end

  def wizard_cir_for_step(step)
    raise InvalidStep unless step.in?(Wizard::CarsInsuranceRequest::STEPS)

    "Wizard::CarsInsuranceRequest::#{step.camelize}".constantize.new(session[:cir_attributes])
  end

  def cir_wizard_params
    params.require(:cir_wizard).permit(
      :full_name,
      :address,
      :phone_number,
      :email,
      :id_card,
      :country,
      :id_card_img,
      :car_brand,
      :car_model,
      :car_year,
      :car_value,
      :driver_license,
      :vehicle_registration)
  end

  class InvalidStep < StandardError; end
end
