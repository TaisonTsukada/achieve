class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
  end

  def confirm

    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    if params[:back]
      render :action => 'index'
    else
      InquiryMailer.received_email(@inquiry).deliver
      render :action => 'thanks'
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name,:email,:category,:content)
  end
end
