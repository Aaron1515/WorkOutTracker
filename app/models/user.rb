class User < ActiveRecord::Base

  has_secure_password

  has_many :workouts

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
