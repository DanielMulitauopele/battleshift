class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    else
      flash[:notice] = "Entered information does not match. Please try again."
      render :new
    end
  end
end
