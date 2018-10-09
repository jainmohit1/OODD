class UserMailer < ApplicationMailer
  default from: 'Househunterinfoooddproject@gmail.com'
  
  def inquiry_reply_email
    @user = params[:user]
    @inquiry_reply = params[:inquiry_reply]
    @inquiry = params[:inquiry]
    @house = params[:house]
    
    @url = 'https://mysterious-temple-73036.herokuapp.com/'
    mail(to: @user.email_address, subject: 'You have new reply from the Realtor')
  end
end
