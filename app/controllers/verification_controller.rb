class VerificationController < ApplicationController
  def create
    EmailVerifierMailer.verify(current_user, params[:email]).deliver_now
    flash[:notice] = "This account has not yet been activated. Please check your email."
    redirect_to root_url
  end
end
