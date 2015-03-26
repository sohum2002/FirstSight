class ApplicationController < ActionController::Base
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
<<<<<<< HEAD
  	
=======
>>>>>>> old-state
	protect_from_forgery with: :exception
  before_action :authenticate_user!,:except => [:home]  

 #  rescue_from ActiveRecord::RecordNotFound do
	# flash[:warning] = 'Resource not found.'
	# redirect_back_or root_path
	# end
	 
	# def redirect_back_or(path)
	#   redirect_to request.referer || path
	# end

  	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name, :about, :occupation, :field, :orientation, :interest, :physical, :free_time, :image, :gender, :birthday)}
	end
  
  def after_sign_in_path_for(user)
  	users_path
  end

  def after_sign_up_path_for(user)
  	user_url(user)
  end



end
