class InsuranceRequestsController < ApplicationController

  def create
    InsuranceRequest.transaction do
      type = ''

      if !params[:request].nil?
        params[:request].each do |r|
          type += "#{r} "
        end
      else
        type = nil
      end

      @request = InsuranceRequest.create( insurance_type: type,
                                          name: params[:name],
                                          email: params[:email],
                                          phone: params[:phone],
                                          contact_via: params[:contact_via_check],
                                          message: params[:message]
                                        )

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
