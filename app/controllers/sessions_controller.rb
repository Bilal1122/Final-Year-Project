class SessionsController < ApplicationController
	def new
	end

	def create
	 user = Register.authenticate(params[:email], params[:password_hash])
	 if user
	    session[:register_id] = user.id
	    redirect_to home_index_path, notice: "Logged in!"
	  else
	    flash.now.alert = "Invalid email or password"
	    redirect_to new_session_path, notice: "incorrect user name and password"
	  end
	end

	def destroy
	  session[:register_id] = nil
	  redirect_to pages_path, :notice => "Logged out!"
	end
end
