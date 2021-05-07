class User < ApplicationRecord
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :venues, through: :events
  validates :email, presence: true, uniqueness: true, on: :create
  validates :email, presence: true, on: :update
  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :password_digest, presence: true

  # def self.from_omniauth
  #   User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
  #     u.email = request.env['omniauth.auth'][:info][:email]
  #     u.username = request.env['omniauth.auth']['info']['image']
  #     u.password = SecureRandom.hex(15)
  #   end
  # end
end
