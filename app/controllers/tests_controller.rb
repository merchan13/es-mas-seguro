class TestsController < ApplicationController

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

    data = {}
    data[:from] = "+Seguro <info@esmasseguro.com>"
    data[:to] = @email
    data[:cc] = "jmerchan@labequis.com"
    data[:subject] = "Test de +Seguro ft. Mailgun"
    data[:text] = "Testing some Mailgun awesomness!"
    data[:html] = (render_to_string partial: 'mails/test',
                                    locals: { insurance_type: @insurance_type,
                                              name: @name,
                                              email: @email,
                                              phone: @phone,
                                              contact_via: @contact_via,
                                              message: @message
                                            },
                                    layout: false )

    @request = RestClient.post "https://api:#{ENV['MAILGUN_KEY']}"\
                    "@api.mailgun.net/v3/esmasseguro.com/messages", data

    puts @request
=begin
    if @request.save
      RequestNotifierMailer.send_request_email(@request).deliver

      render json: @request
    else
      puts "Errores: #{@request.errors.full_messages}"

      if @request.errors.full_messages.first.include? "blank"
        render status: 400, nothing: true
      end
    end
=end
  end

end
