class RequestNotifierMailer < ApplicationMailer
  default :from => 'info@esmasseguro.com'

  def send_request_email(request)
    @request = request
    mail(
          :to => "hola@esmasseguro.com",
          :bcc => "jmerchan@labequis.com",
          :subject => "Información de nueva solicitud de seguro. [##{@request.id}]"
        )
  end

  def send_client_email(request)
    @request = request
    mail(
          :to => "#{@request.email}",
          :subject => "Recibimos su nueva solicitud de seguro. [##{@request.id}]"
        )
  end
end
