class ReportMailer < ActionMailer::Base
  default from: "info@tritonls.ca"

  def report_confirmation(user)  		
  		@user = user
  		#mail(subject: "New User Signup: #{@user.email}")
  		mail(:to => user.email, :subject => "Tri-Status - Customer Report Details")
  	end
end

