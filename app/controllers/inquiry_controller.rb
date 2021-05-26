class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
  end

  def confirm

    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render action: :confirm
    else
      render action: :index
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    if params[:back]
      render action: :index
    else
      InquiryMailer.received_email(@inquiry).deliver

    end

  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name,:email,:category,:content)
  end
end
