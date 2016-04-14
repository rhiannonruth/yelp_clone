require 'rails_helper'

describe User, type: :model do

  subject(:user) { create(:user) }
  let(:restaurant) { build(:restaurant) }
  let(:review) { build(:review) }

  it { is_expected.to have_many(:reviewed_restaurants)}
  it { is_expected.to have_many(:restaurants)}
  it { is_expected.to have_many(:reviews)}

  before do
    link_restaurant_and_user(user, restaurant)
    link_review_with_restaurant_and_user(review, restaurant, user)
  end

  it '#creator_of?' do
    expect(user).to be_creator_of(restaurant)
  end

  it '#reviewer_of?' do
    expect(user).to be_reviewer_of(restaurant)
  end

  it '#author_of?' do
    expect(user).to be_author_of(review)
  end

end
