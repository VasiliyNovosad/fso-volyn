class Competition < ActiveRecord::Base
  belongs_to :user
  has_many :races
end
