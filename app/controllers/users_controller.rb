class UsersController < ApplicationController
  before_action :authorized_user

  def index
    @users = User.all
  end

  def toggle_user_admin
    @user = User.find(params[:id])
    @user.toggle!(:admin_profile)
    redirect_to users_path
  end
end
