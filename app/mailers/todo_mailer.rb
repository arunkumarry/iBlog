class TodoMailer < ActionMailer::Base
	default from: "arunkumar.ry1@gmail.com"

	  def todo_email(todo)
	  	@todo = todo
	    @url  = 'http://gmail.com/login'
	  	mail(to: "arunkumar.ry1@gmail.com", subject:  "created a todo.")
	  end

	  # def sample_email(user)
	  #   @user = user
	  #   @url  = 'http://gmail.com/login'
	  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	  # end
end