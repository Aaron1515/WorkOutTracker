class Progress < ActiveRecord::Base
  belongs_to :user
  belongs_to :measurement
end
