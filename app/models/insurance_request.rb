require 'rest-client'

class InsuranceRequest < ApplicationRecord
  validates :insurance_type,  presence: true
  validates :name,            presence: true
  validates :email,           presence: true
  validates :phone,           presence: true
  validates :contact_via,     presence: true

  has_one :rating

  def send_rate_link
    client_data = {}
    client_data[:from] = "+Seguro <info@esmasseguro.com>"
    client_data[:to] = self.email
    client_data[:bcc] = "jmerchan@labequis.com"
    client_data[:subject] = "Quisieramos saber cómo te fue con +Seguro"
    client_data[:html] = (ApplicationController.new.render_to_string(
                                                                      partial: 'mails/rate_your_experience',
                                                                      locals: { token: self.token,
                                                                                name: self.name
                                                                              },
                                                                      layout: false
                                                                    )
                          )



    RestClient.post "https://api:#{ENV['MAILGUN_KEY']}"\
                    "@api.mailgun.net/v3/esmasseguro.com/messages", client_data
  end
end
