class User < ApplicationRecord
  
  # Variables/Expressions/Methods #
  
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  # Validations #
  
  validates :name,      presence: true, 
                        length: { maximum: 50 }
  
  validates :email,     presence: true,
                        length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    
  validates :password,  length: { minimum: 6 },
                        presence: true
    
  
  has_secure_password
    
end
