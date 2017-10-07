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
      @birthday = params[:birthday]
      @email = params[:email]
      @phone = params[:phone]
      @contact_via = params[:contact_via_check]
      @message = params[:message]

      if @insurance_type.include? "Auto"
        @cir_document = params[:cir_document]
        @cir_brand = params[:cir_brand]
        @cir_model = params[:cir_model]
        @cir_year = params[:cir_year]
        @cir_price = params[:cir_price]
      end

      if @insurance_type.include? "Salud"
        @hir_type = params[:hir_type_check]
        @hir_cover = params[:hir_cover_check]

        if @hir_cover == "familiar"
          @hir_dependents = params[:hir_dependents]
        end
      end

      send_client_email

      send_admin_email

      if @client_response.code == 200 && @admin_response.code == 200

        InsuranceRequest.create(name: @name,
                                birthday: @birthday,
                                insurance_type: @insurance_type,
                                message: @message,
                                contact_via: @contact_via,
                                email: @email.downcase,
                                phone: @phone,
                                cir_document: @cir_document,
                                cir_brand: @cir_brand,
                                cir_model: @cir_model,
                                cir_year: @cir_year,
                                cir_price: @cir_price,
                                hir_type: @hir_type,
                                hir_cover: @hir_cover,
                                hir_dependents: @hir_dependents,
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
                                                      birthday: @birthday,
                                                      email: @email.downcase,
                                                      phone: @phone,
                                                      contact_via: @contact_via,
                                                      cir_document: @cir_document,
                                                      cir_brand: @cir_brand,
                                                      cir_model: @cir_model,
                                                      cir_year: @cir_year,
                                                      cir_price: @cir_price,
                                                      hir_type: @hir_type,
                                                      hir_cover: @hir_cover,
                                                      hir_dependents: @hir_dependents,
                                                      message: @message
                                                    },
                                            layout: false )

      @admin_response = RestClient.post "https://api:#{ENV['MAILGUN_KEY']}"\
                      "@api.mailgun.net/v3/esmasseguro.com/messages", admin_data
    end

end
