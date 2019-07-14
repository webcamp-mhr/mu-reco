class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resourse)
    user_path(resourse)
  end

  def after_sign_out_path_for(resourse)
    root_path(resourse)
  end


end
