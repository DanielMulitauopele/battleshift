class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.activated == true
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user_path(user)
    elsif
      user && user.authenticate(params[:password]) && user.activated == false
      session[:user_id] = user.id
      flash[:notice] = "This account has not yet been activated. Please check your email."
      redirect_to root_url
    else
      flash[:notice] = "Entered information does not match. Please try again."
      render :new
    end
  end
end
