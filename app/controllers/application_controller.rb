class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resourse)
    products_path
  end

  def after_sign_out_path_for(resourse)
    root_path(resourse)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_lastname, :user_firstname, :user_lastname_kana, :user_firstname_kana, :email, :phone_number])
  end


end
