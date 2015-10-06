class Competitor < ActiveRecord::Base
  belongs_to :race
  belongs_to :category
  has_one :result

  validates :name, presence: true
  validates :surname, presence: true
  validates :birthday, presence: true
  validates :name, presence: true

  private

  def full_name
  	surname + " " + name
  end

end
