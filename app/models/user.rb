class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :venues, through: :events
  has_secure_password

  validates :email, presence: true, uniqueness: true, on: :create
  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :password_digest, presence: true
 
end
