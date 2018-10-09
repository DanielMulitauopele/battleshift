class UsersController < ApplicationController
  def show
    id = params[:id]
    @user = AppUserRepo.new.app_user(id)
  end

  def index
    @users = AppUserRepo.new.app_users
  end
end
