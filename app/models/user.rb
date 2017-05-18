class User < ApplicationRecord
  has_secure_password

  has_many :encounters
  has_many :messages
end
