class UserMailer < ActionMailer::Base
  default :from => "priyanko.dey33@gmail.com"

  def registration_confirmation(user)
 	@user1=user
    mail(:to => user.email, :subject => "Registered")
  end

end
