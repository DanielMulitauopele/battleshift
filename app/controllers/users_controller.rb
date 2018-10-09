class UsersController < ApplicationController
  def show
    id = params[:id]
    #set env variable for endpoint
    # for now hardcode the heroku link

    repo = AppUserRepo.new
    @user = repo.app_user(id)
  end

  def index
    repo = AppUserRepo.new
    @users = repo.app_users
  end
end
