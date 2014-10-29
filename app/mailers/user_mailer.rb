class UserMailer < ActionMailer::Base
  default :from => "info@tritonls.ca"

  def registration_confirmation(user,password)
 	@user1=user
 	@password = password
    mail(:to => user.email, :subject => "Tri-Status - Customer Login Access")
  end

end
