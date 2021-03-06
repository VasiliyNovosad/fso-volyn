class Category < ActiveRecord::Base
  belongs_to :race
  has_many :competitors
  belongs_to :distance

  validates :title, presence: true
end
