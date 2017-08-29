class ComplaintNotifierMailer < ApplicationMailer
  default :from => 'info@esmasseguro.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_complaint_email(complaint)
    @complaint = complaint
    mail(
          :to => "hola@esmasseguro.com",
          :bcc => "jmerchan@labequis.com",
          :subject => "Información de reclamo sobre póliza de seguro. [##{@complaint.id}]"
        )
  end

  def send_client_email(complaint)
    @complaint = complaint
    mail(
          :to => "#{@complaint.email}",
          :subject => "Recibimos su reclamo. [##{@complaint.id}]"
        )
  end
end
