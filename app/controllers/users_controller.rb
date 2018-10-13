class UsersController < ApplicationController
  def show
    @user = AppUserRepo.new.app_user(params[:id])
  end

  def index
    @users = AppUserRepo.new.app_users
  end

  def edit
    @id = params[:id]
  end

  def update
    user = AppUserRepo.new.app_user(params[:id])
    BattleshiftService.new.patch_user(params[:id], user_params)
    flash[:success] = "Successfully updated #{user.name}."
    redirect_to "/users"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to dashboard_path
  end

  private

  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end
end
