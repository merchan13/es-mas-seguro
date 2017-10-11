class PagesController < ApplicationController

  def home
  end

  def about
  end

  def faq
  end

  def terms
  end

  def privacy
  end

  def rating
    @request = InsuranceRequest.where(token: params[:token]).first

    if @request.present? && !@request.token_expired
      @content = 1
    else
      @content = 2
    end

    puts @content
  end

  def save_rating
    Rating.transaction do
      @request = InsuranceRequest.where(token: params[:token]).first

      @calification = params[:rate_calification]
      @message = params[:message]

      @rate = Rating.create(calification: @calification, message: @message, insurance_request: @request)

      if @rate.save
        @request.rating = @rate
        @request.token_expired = true

        @request.save

        redirect_to controller: 'pages', action: 'rating', token: @request.token
      else
        render status: 400, nothing: true
      end
    end
  end

  def test

  end

end
