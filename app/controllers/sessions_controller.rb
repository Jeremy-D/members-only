class SessionsController < ApplicationController
	def new
	end
	
	def create
		@user = User.find_by(email: params[:session][:email].downcase)

		if @user && @user.authenticate(params[:session][:password])
			log_in @user
			params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
			message = "Successful Login!"
			flash[:success_login] = message
      redirect_to root_url
     else
     	message = "Sorry, that user/password combination must be incorrect ¯\\_(ツ)_/¯ "
     	flash[:warning] = message
      redirect_to root_url
		end
	end
	def destroy
		if logged_in? 
			message = "Successful Sign out!"
			flash[:success_logout] = message
			log_out
		else
			message = "You can't log out if you're not logged in!"
			flash[:warning] = message
		end

		log_out if logged_in?
		redirect_to root_url
	end
end
