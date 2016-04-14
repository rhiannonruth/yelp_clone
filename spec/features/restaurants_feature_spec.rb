require 'rails_helper'

feature 'restaurants' do

  let(:user) { create(:user) }
  let(:restaurant) { build(:restaurant) }

  before do
    user_sign_in(user)
  end

  context 'restaurant has been created' do
    before do
      link_restaurant_and_user(user, restaurant)
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content("#{restaurant.name}")
      expect(page).not_to have_content('No restaurants yet')
    end

    context 'editing restaurants' do
      scenario 'let a user edit a restaurant', js: false, focus: false do
        visit '/restaurants'
        click_link "Edit #{restaurant.name}"
        fill_in 'Name', with: 'Kentucky Fried Chicken'
        click_button 'Update Restaurant'
        expect(page).to have_content 'Kentucky Fried Chicken'
        expect(current_path).to eq '/restaurants'
      end
    end

    context 'deleting restaurants' do
      scenario 'removes a restaurant when a user clicks a delete link' do
        visit '/restaurants'
        click_link "Delete #{restaurant.name}"
        expect(page).not_to have_content restaurant.name
        expect(page).to have_content 'Restaurant deleted successfully'
      end
    end

    context 'viewing restaurants' do

      scenario 'lets a user view a restaurant' do
        visit '/restaurants'
        click_link "#{restaurant.name}"
        expect(page).to have_content "#{restaurant.name}"
        expect(current_path).to eq "/restaurants/#{restaurant.id}"
      end
    end
  end

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
  context 'an invalid restaurant' do
    it 'does not let you submit a name that is too short' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end
  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end
  end
end
