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
    BattleshiftService.new.patch_user(params[:id], user_update_params)
    flash[:success] = "Successfully updated #{user.name}."
    redirect_to "/users"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_create_params)
    if @user.save
      session[:user_id] = @user.id
      AccountVerifierMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to dashboard_path
    else
      flash[:notice] = "Something went wrong, please try again"
      render :new
    end
  end

  private

  def user_update_params
    params.permit(:email, :name, :password, :password_confirmation)
  end

  def user_create_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
