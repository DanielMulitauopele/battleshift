class EmailVerifierMailer < ApplicationMailer
  def verify(user, user_email)
    @user = user
    mail(to: user_email, subject: "#{user.name.capitalize}, verify your Battleshift account")
  end
end
