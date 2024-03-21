class ApplicationController < ActionController::Base
  def authorized_user
    unless current_user.admin_profile
      redirect_to root_path
    end
  end
end
