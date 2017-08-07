class InsuranceRequestsController < ApplicationController

  def create
    InsuranceRequest.transaction do
      type = ''
      via = ''

      if !params[:contact_via].nil?
        params[:contact_via].each do |c|
          via += c
        end
      else
        via = nil
      end

      if !params[:request].nil?
        params[:request].each do |r|
          type += r
        end
      else
        type = nil
      end

      @request = InsuranceRequest.create( name: params[:name], insurance_type: type, contact_via: via, message: params[:message])

      if @request.save
        RequestNotifierMailer.send_request_email(@request).deliver

        render json: @request
      else
        puts "Errores: #{@request.errors.full_messages}"
        if @request.errors.full_messages.first.include? "blank"
          render status: 400, nothing: true
        end
      end
    end
  end

end
