class Competitor < ActiveRecord::Base
  belongs_to :race
  belongs_to :category
end
