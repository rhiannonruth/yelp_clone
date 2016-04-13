# §require 'rails_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many(:reviews).dependent(:destroy)}

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid if a restaurant with the same name exists' do
    restaurant = Restaurant.create(name: "kfca")
    restaurant2 = Restaurant.new(name: "kfca")
    expect(restaurant2).to have(1).error_on(:name)
    expect(restaurant2).not_to be_valid
  end
end
