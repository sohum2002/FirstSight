class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protected
  
  # protect_from_forgery with: :exception

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :photo << :birthday << :occupation << :field << :orientation << :interest << :physical << :free_time
  #   devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :photo << :birthday << :occupation << :field << :orientation << :interest << :physical << :free_time
  # end
end
