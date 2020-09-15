class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
    devise_parameter_sanitizer.permit(:sign_in)
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'yugo' && password == '29299'
    end
  end
end