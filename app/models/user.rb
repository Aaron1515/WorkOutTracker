class User < ActiveRecord::Base

  has_secure_password

  has_many :weeks

  has_many :progresses
  has_many :measurements, through: :progresses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
