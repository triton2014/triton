class UserMailer < ActionMailer::Base
  default :from => "triton.triton2014@gmail.com"

  def registration_confirmation(user,password)
 	@user1=user
 	@password = password
    mail(:to => user.email, :subject => "Tri-Status - Customer Login Access")
  end

end
