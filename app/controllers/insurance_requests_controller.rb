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

      if @insurance_type.include? "Auto"
        @cir_brand = params["brand"]
        @cir_model = params["model"]
        @cir_year = params["year"]
        @cir_price = params["price"]
      end

      send_client_email

      send_admin_email

      if @client_response.code == 200 && @admin_response.code == 200

        InsuranceRequest.create(name: @name,
                                insurance_type: @insurance_type,
                                message: @message,
                                contact_via: @contact_via,
                                email: @email.downcase,
                                phone: @phone,
                                cir_brand: @cir_brand,
                                cir_model: @cir_model,
                                cir_year: @cir_year,
                                cir_price: @cir_price,
                                token: SecureRandom.uuid,
                                token_expired: false)

      else
        render status: 400, nothing: true
      end
    else
      render status: 400, nothing: true
    end
  end

  private
    def send_client_email
      client_data = {}
      client_data[:from] = "+Seguro <info@esmasseguro.com>"
      client_data[:to] = @email.downcase
      client_data[:bcc] = "jmerchan@labequis.com"
      client_data[:subject] = "Recibimos su nueva solicitud de seguro"
      client_data[:html] = (render_to_string partial: 'mails/welcome',
                                             locals: { name: @name },
                                             layout: false )

      @client_response = RestClient.post "https://api:#{ENV['MAILGUN_KEY']}"\
                      "@api.mailgun.net/v3/esmasseguro.com/messages", client_data
    end

    def send_admin_email
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
                                                      cir_brand: @cir_brand,
                                                      cir_model: @cir_model,
                                                      cir_year: @cir_year,
                                                      cir_price: @cir_price,
                                                      message: @message
                                                    },
                                            layout: false )

      @admin_response = RestClient.post "https://api:#{ENV['MAILGUN_KEY']}"\
                      "@api.mailgun.net/v3/esmasseguro.com/messages", admin_data
    end

end
