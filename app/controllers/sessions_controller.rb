class SessionsController < ApplicationController
	def create
		user = User.find_by(email:session_params[:email])
		if user && user.authenticate(session_params[:password])
			session[:user_id] = user.id
			redirect_to '/shoes'
		else
			flash[:log_error] = 'Invalid credentials'
			redirect_to '/'
		end
	end
	def destroy
		reset_session
		redirect_to '/'
	end
	private
	def session_params
		params.require(:session).permit(:email, :password)
	end
end
