class Restaurant < ActiveRecord::Base
  validates :name, length: {minimum: 3}, uniqueness: true
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :user, presence: true
  has_many :user_reviews, through: :reviews, source: :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # validates :image, presence: true

  def build_review(review_params, user)
    review = Review.new(review_params)
    review.restaurant = self
    review.user = user
    review.save
  end

end
