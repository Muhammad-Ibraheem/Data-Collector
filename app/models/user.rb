class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  has_many :csvs
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end
