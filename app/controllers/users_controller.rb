class UsersController < ApplicationController
  def show
    id = params[:id]
    @user = AppUserRepo.new.app_user(id)
  end

  def index
    @users = AppUserRepo.new.app_users
  end

  def edit
    @id = params[:id]
  end

  def update
    id = params[:id]
    email = params[:email]
    user = AppUserRepo.new.app_user(id)

    BattleshiftService.new.patch_user(id, email)

    flash[:success] = "Successfully updated #{user.name}."
    redirect_to "/users"
  end
end
