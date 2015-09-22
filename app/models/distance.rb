class Distance < ActiveRecord::Base
  has_many :categories
  belongs_to :race
end
