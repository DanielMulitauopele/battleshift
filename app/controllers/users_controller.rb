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
    conn = Faraday.new(url: "http://localhost:3000")
    conn.patch("/api/v1/users/#{id}", {email: email})

    flash[:success] = "Successfully updated Josiah Bartlet."
    redirect_to "/users"
  end
end
