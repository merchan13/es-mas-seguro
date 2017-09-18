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

    @insurance_type = type
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @contact_via = params[:contact_via_check]
    @message = params[:message]

    client_data = {}
    client_data[:from] = "+Seguro <info@esmasseguro.com>"
    client_data[:to] = @email
    client_data[:bcc] = "jmerchan@labequis.com"
    client_data[:subject] = "Recibimos su nueva solicitud de seguro"
    client_data[:html] = (render_to_string partial: 'mails/welcome',
                                    locals: { insurance_type: @insurance_type,
                                              name: @name,
                                              email: @email,
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
    #admin_data[:to] = "j.merchan95@hotmail.com"
    admin_data[:bcc] = "jmerchan@labequis.com"
    admin_data[:subject] = "Información de nueva solicitud de seguro"
    admin_data[:html] = (render_to_string partial: 'mails/request',
                                    locals: { insurance_type: @insurance_type,
                                              name: @name,
                                              email: @email,
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
    else
      render status: 400, nothing: true
    end
  end

end
