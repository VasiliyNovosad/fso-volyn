class Race < ActiveRecord::Base
  belongs_to :competition
  has_many :categories
  has_many :competitors
end
