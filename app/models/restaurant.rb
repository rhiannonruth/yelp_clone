class Restaurant < ActiveRecord::Base
  validates :name, length: {minimum: 3}, uniqueness: true
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :user, presence: true
  has_many :user_reviews, through: :reviews, source: :user

end
