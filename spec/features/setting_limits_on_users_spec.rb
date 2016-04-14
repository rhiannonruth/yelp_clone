require 'rails_helper'

feature "Setting limits on users" do

  let(:restaurant) { build(:restaurant) }
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:review) { build(:review) }



  before do
    restaurant.user = user1
    restaurant.save
    review.restaurant = restaurant
    review.user = user1
    review.save

    visit('/')
    click_link 'Sign in'
    fill_in('Email', with: user2.email)
    fill_in('Password', with: user2.password)
    click_button 'Log in'
  end

  scenario 'User can only edit restaurant they have created', js: false do

      click_link "Edit #{restaurant.name}"
      expect(page).not_to have_button 'Update Restaurant'
      expect(page).to have_content 'Cannot edit restaurant'
  end

  scenario 'User can only delete restaurant they have created', js: false do
      # byebug
      click_link "Delete #{restaurant.name}"
      expect(page).to have_content restaurant.name
      expect(page).to have_content 'Cannot delete restaurant'
  end


  scenario 'User can only create one review per restaurant', js: false, focus: true do
    # byebug
    click_link "Review #{restaurant.name}"
    expect(page).not_to have_button 'Leave Review'
    expect(page).to have_content 'Cannot re-review restaurant'

  end

end
