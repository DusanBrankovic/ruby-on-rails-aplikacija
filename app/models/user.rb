class User < ApplicationRecord
  
  belongs_to :user_type
  has_secure_password

  validates :user_type, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true
  
#   before_save { self.email = email.downcase }
#   has_secure_password
#   validates :password, presence: true, length: { minimum: 6 }
  
#   validates :name,  presence: true, length: { maximum: 50 }
#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#   validates :email, presence: true, length: { maximum: 255 },
#                     format: { with: VALID_EMAIL_REGEX },
#                     uniqueness: true
                    
#   attr_accessor :remember_token
  
# # Returns the hash digest of the given string.
#   def User.digest(string)
#     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
#                                                   BCrypt::Engine.cost
#     BCrypt::Password.create(string, cost: cost)
#   end

#   # Returns a random token.
#   def User.new_token
#     SecureRandom.urlsafe_base64
#   end

#   def remember
#     self.remember_token = User.new_token
#     update_attribute(:remember_digest, User.digest(remember_token))
#   end
  
#   # Forgets a user.
#   def forget
#     update_attribute(:remember_digest, nil)
#   end
  
#   # Returns true if the given token matches the digest.
#   def authenticated?(remember_token)
#     BCrypt::Password.new(remember_digest).is_password?(remember_token)
#   end
end
