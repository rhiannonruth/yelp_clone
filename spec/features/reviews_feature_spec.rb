require 'rails_helper'

feature 'reviewing' do

  let(:user) { create(:user) }
  let(:restaurant) { build(:restaurant) }

  before do
    link_restaurant_and_user(user, restaurant)
    user_sign_in(user)
  end

  scenario 'allows users to leave a review using a form', js: false, focus: true do
    visit '/restaurants'
    click_link "Review #{restaurant.name}"
    expect(current_path).to eq "/restaurants/#{restaurant.id}/reviews/new"
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

end
