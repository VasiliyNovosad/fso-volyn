class Result < ActiveRecord::Base
	belongs_to :race
	belongs_to :competitor

	validates :start_number, presence: true, uniqueness: { scope: :race }
end
