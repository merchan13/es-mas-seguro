class RequestNotifierMailer < ApplicationMailer
  default :from => 'info@esmasseguro.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_request_email(request)
    @request = request
    mail(
          :to => "jmerchan@labequis.com",
          :subject => "Información de nueva solicitud de seguro. [##{@request.id}]"
        )
  end
end
