class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  # def current_user
  #   @current_user = User.first
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
  end

end
