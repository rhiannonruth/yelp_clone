require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaraunts have been added' do
    before do
      Restaurant.create(name: 'Gourmet Burger Kitchen')
    end

    scenario 'display restaraunts' do
      visit '/restaurants'
      expect(page).to have_content('Gourmet Burger Kitchen')
      expect(page).not_to have_content('No restaraunts yet')
    end
  end
end
