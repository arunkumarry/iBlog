class ContactMailer < ActionMailer::Base
	default from: "arunkumar.ry1@gmail.com"

	  def contact_email(contact)
	  	@contact = contact
	    @url  = 'http://gmail.com/login'
	  	mail(to: "arunkumar.ry1@gmail.com", subject:  "sent a message.")
	  end

	  # def sample_email(user)
	  #   @user = user
	  #   @url  = 'http://gmail.com/login'
	  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	  # end
end