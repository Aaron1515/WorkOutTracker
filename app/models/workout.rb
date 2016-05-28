class Workout < ActiveRecord::Base
  belongs_to :user
  validates :name, :reps, :sets, :weight, :completed, :user_id, :phase, :rest, :day, presence: true
end
