class Day < ActiveRecord::Base
  belongs_to :week
  has_many :workouts
end
