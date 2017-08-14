class ComplaintNotifierMailer < ApplicationMailer
  default :from => 'info@esmasseguro.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_complaint_email(complaint)
    @complaint = complaint
    mail(
          :to => "jmerchan@labequis.com",
          :subject => "Información de reclamo sobre póliza de seguro. [##{@complaint.id}]"
        )
  end
end
