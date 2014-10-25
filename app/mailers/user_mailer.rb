class UserMailer < ActionMailer::Base
  default :from => "tritonls@tritonlsstatus.ca"

  def registration_confirmation(user,password)
 	@user1=user
 	@password = password
    mail(:to => user.email, :subject => "Tri-Status - Customer Login Access")
  end

end
