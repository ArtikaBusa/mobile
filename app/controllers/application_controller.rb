# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session
  before_action :set_locale

  protected

  def set_locale
    if params[:locale].present?
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email contact_no address password password_confirmation profile_photo role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email contact_no address password password_confirmation profile_photo role])
  end
end
