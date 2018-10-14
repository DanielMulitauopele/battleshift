# Preview all emails at http://localhost:3000/rails/mailers/account_verifier
class AccountVerifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_verifier/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    AccountVerifierMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/account_verifier/password_reset
  def password_reset
    AccountVerifierMailer.password_reset
  end
end
