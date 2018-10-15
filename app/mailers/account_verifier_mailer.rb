class AccountVerifierMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: @user.email, subject: "Hello #{@user.name}, activate your Battleshift Account!"
  end
end
