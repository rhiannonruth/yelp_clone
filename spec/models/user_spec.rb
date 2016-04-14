require 'rails_helper'

describe User, type: :model do

  subject(:user) { create(:user) }

  it { is_expected.to have_many(:reviewed_restaurants)}
  it { is_expected.to have_many(:restaurants)}
  it { is_expected.to have_many(:reviews)}

  it '#creator_of?' do
    restaurant = build(:restaurant)
    restaurant.user = user
    restaurant.save
    expect(user).to be_creator_of(restaurant)
  end
end
