class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :competitions
  has_many :articles

  validates :name, presence: true, uniqueness: true

  def author_of?(competition)
    competition.user.id == self.id
  end

  def author_of?(article)
    article.user.id == self.id
  end

end
