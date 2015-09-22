class Category < ActiveRecord::Base
  belongs_to :race
  has_many :competitors
end
