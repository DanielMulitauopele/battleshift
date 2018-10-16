class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(id: params[:id])
      if user && !user.activated?
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
