class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :reviews
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant
  has_many :restaurants

  def self.from_omniauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def creator_of?(restaurant)
    restaurants.include? restaurant
  end

  def reviewer_of?(restaurant)
   reviewed_restaurants.include? restaurant
  end

  def author_of?(review)
   reviews.include? review
  end

end
