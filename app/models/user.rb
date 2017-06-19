class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  has_many :products, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :products_bought, through: :purchases, source: :product
  validates :first_name, :last_name, presence: true, length: { minimum: 2}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format:{with: EMAIL_REGEX} 
end
