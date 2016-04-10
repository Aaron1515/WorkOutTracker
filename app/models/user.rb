class User < ActiveRecord::Base

  has_secure_password

  has_many :daily_workouts

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
