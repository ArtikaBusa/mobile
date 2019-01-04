class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email contact_no address password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :contact_no, :address, :password, :password_confirmation) }
  end
end
