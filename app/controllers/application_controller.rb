class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

	private

	def current_user
	  @current_user ||= Register.find(session[:register_id]) if session[:register_id]
	end

  def authorize_admin
    if current_user.role != "Admin"
      redirect_to home_index_path 
    end
  end
  def check_user
    if current_user == ""
      redirect_to new_session_path 
    end
  end
end
