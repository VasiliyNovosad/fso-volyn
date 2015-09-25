class Competition < ActiveRecord::Base
  belongs_to :user
  has_many :races

  validates :title, presence: true, uniqueness: true
end
