class User < ApplicationRecord
  has_secure_password

  has_many :reviews

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, length: {minimum: 5}

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = where("email = ?", email.downcase).first
    if user != nil && user.authenticate(password)
      user
    else
      nil
    end 
  end 
end
