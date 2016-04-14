require 'rails_helper'

describe Restaurant, type: :model do

  let(:user) { create(:user) }
  subject(:restaurant) { build(:restaurant) }
  let(:restaurant2) { build(:restaurant) }


  it { is_expected.to have_many(:reviews).dependent(:destroy) }
  it { is_expected.to have_many(:user_reviews) }
  it { is_expected.to belong_to :user }

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    link_restaurant_and_user(user, restaurant)
    link_restaurant_and_user(user, restaurant2)
    expect(restaurant2).to have(1).error_on(:name)
    expect(restaurant2).not_to be_valid
  end
end
