require 'rails_helper'

feature "Setting limits on users", focus: true do

  scenario 'User can only edit restaurant they have created', js: false do
      user1 = create(:user)
      user2 = create(:user)
      kfc = build(:restaurant)
      kfc.user = user1
      kfc.save
      visit('/')
      click_link 'Sign in'
      fill_in('Email', with: user2.email)
      fill_in('Password', with: user2.password)
      click_button 'Log in'
      click_link 'Edit KFC'
      # byebug
      expect(page).not_to have_button 'Update Restaurant'
      expect(page).to have_content 'Can not edit restaurant'
  end

end
