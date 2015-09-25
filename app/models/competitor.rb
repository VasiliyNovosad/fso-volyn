class Competitor < ActiveRecord::Base
  belongs_to :race
  belongs_to :category

  validates :name, presence: true
  validates :surname, presence: true
  validates :birthday, presence: true
  validates :name, presence: true
end
