class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.sanitize(:account_update, keys: [:name])
  end

end
