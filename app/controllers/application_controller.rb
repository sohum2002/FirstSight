class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception
  before_action :authenticate_user!,:except => [:home]  

 #  rescue_from ActiveRecord::RecordNotFound do
	# flash[:warning] = 'Resource not found.'
	# redirect_back_or root_path
	# end
	 
	def redirect_back_or(path)
	  redirect_to request.referer || path
	end

  # before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protected
  

end
