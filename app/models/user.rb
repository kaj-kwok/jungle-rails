class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 5}

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = where("email = ?", email.downcase).first
    if user.authenticate(password)
      user
    else
      nil
    end 
  end 
end
