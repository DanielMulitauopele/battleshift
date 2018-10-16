class User < ApplicationRecord
  attr_accessor :activation_token

  validates_presence_of :name,
                        :email,
                        :password_digest

  has_secure_password

  before_create :assign_api_key

  def activate
    update_columns(activated: true)
  end

  private

  def assign_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
