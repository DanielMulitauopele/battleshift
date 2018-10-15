class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
      if user && !user.activated? && user.authenticated?(:activation, params[:id])
        user.activate
        log_in(user)
        flash[:success] = "Thank you! Your account is now activated!"
        redirect_to(dashboard_path)
      else
        flash[:notice] = "Invalid activation link"
        redirect_to(root_path)
      end
  end
end
