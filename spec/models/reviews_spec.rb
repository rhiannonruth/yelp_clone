require 'rails_helper'

describe Review, type: :model do

  let(:user) { create(:user) }
  let(:restaurant) { build(:restaurant) }
  subject(:review) { build(:review) }
  let(:review2)  { build(:review) }

  it { is_expected.to belong_to :restaurant }
  it { is_expected.to belong_to :user }

  it 'is invalid if the rating is more than 5' do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  it 'is invalid if the user and restaurant FKs are the same', focus: false do
    link_review_with_restaurant_and_user(review, restaurant, user)
    link_review_with_restaurant_and_user(review2, restaurant, user)
    expect(review2).to have(1).error_on(:user)
  end

end
