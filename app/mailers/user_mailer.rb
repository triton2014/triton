class UserMailer < ActionMailer::Base
  default :from => "priyanko.dey33@gmail.com"

  def registration_confirmation(user,password)
 	@user1=user
 	@password = password
    mail(:to => user.email, :subject => "You have added to the Triton")
  end

end
