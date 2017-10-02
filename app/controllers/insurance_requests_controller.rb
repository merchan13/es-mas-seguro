class InsuranceRequestsController < ApplicationController

  def create
    type = ''

    if !params[:request].nil?
      params[:request].each do |r|
        type += "#{r} "
      end
    else
      type = nil
    end

    if type.present?
      @insurance_type = type
      @name = params[:name]
      @email = params[:email]
      @phone = params[:phone]
      @contact_via = params[:contact_via_check]
      @message = params[:message]

      client_data = {}
      client_data[:from] = "+Seguro <info@esmasseguro.com>"
      client_data[:to] = @email.downcase
      client_data[:bcc] = "jmerchan@labequis.com"
      client_data[:subject] = "Recibimos su nueva solicitud de seguro"
      client_data[:html] = (render_to_string partial: 'mails/welcome',
                                      locals: { insurance_type: @insurance_type,
                                                name: @name,
                                                email: @email.downcase,
                                                phone: @phone,
                                                contact_via: @contact_via,
                                                message: @message
                                              },
                                      layout: false )

      @client_response = RestClient.post "https://api:#{ENV['MAILGUN_KEY']}"\
                      "@api.mailgun.net/v3/esmasseguro.com/messages", client_data

      admin_data = {}
      admin_data[:from] = "+Seguro <info@esmasseguro.com>"
      admin_data[:to] = "info@esmasseguro.com"
      admin_data[:bcc] = "jmerchan@labequis.com"
      admin_data[:subject] = "Información de nueva solicitud de seguro"
      admin_data[:html] = (render_to_string partial: 'mails/request',
                                      locals: { insurance_type: @insurance_type,
                                                name: @name,
                                                email: @email.downcase,
                                                phone: @phone,
                                                contact_via: @contact_via,
                                                message: @message
                                              },
                                      layout: false )

      @admin_response = RestClient.post "https://api:#{ENV['MAILGUN_KEY']}"\
                      "@api.mailgun.net/v3/esmasseguro.com/messages", admin_data

      if @client_response.code == 200 && @admin_response.code == 200

        puts @client_response
        puts @admin_response

        InsuranceRequest.create(name: @name, insurance_type: @insurance_type, message: @message, contact_via: @contact_via, email: @email.downcase, phone: @phone, token: SecureRandom.uuid, token_expired: false)

      else
        render status: 400, nothing: true
      end
    else
      render status: 400, nothing: true
    end
  end

end
