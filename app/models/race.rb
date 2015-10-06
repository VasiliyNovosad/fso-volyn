class Race < ActiveRecord::Base
  belongs_to :competition
  has_many :categories
  has_many :competitors
  has_many :distances
  has_many :results

  validates :title, presence: true
end
