class ComplaintsController < ApplicationController

  def create
    Complaint.transaction do

      @complaint = Complaint.create(  policy_number: params[:policy_number],
                                      name: params[:name],
                                      email: params[:email],
                                      phone: params[:phone],
                                      message: params[:message]
                                    )

      if @complaint.save
        ComplaintNotifierMailer.send_complaint_email(@complaint).deliver
        ComplaintNotifierMailer.send_client_email(@complaint).deliver
        render json: @complaint
      else
        puts "Errores: #{@complaint.errors.full_messages}"
        if @complaint.errors.full_messages.first.include? "blank"
          render status: 400, nothing: true
        end
      end
    end
  end

end
