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

  def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :last_name, :email) }
	end
  

end
