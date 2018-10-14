class AccountVerifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_verifier_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user

    mail to: user.email, subject: "Hello #{user.name}, activate your Battleshift Account!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_verifier_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
