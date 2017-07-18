class InsuranceRequestsController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    # ...
  end

  def create
    # Create the request from params
    @request = InsuranceRequest.new(request_params)
    if @request.save
      # Deliver the request email
      RequestNotifierMailer.send_request_email(@request).deliver
      redirect_to(root_path, :notice => 'User created')
    else
      render 'pages/home'
    end
  end

  private
    def request_params
      params.require(:insurance_request).permit(:name, :insurance_type, :message)
    end

end
