require 'rails_helper'

feature "Setting limits on users", focus: true do

  scenario 'User can only edit restaurant they have created', js: true do


      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'user1@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      # byebug
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'

      click_link 'Sign out'

      click_link('Sign up')
      fill_in('Email', with: 'user2@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')

      click_link 'Edit KFC'
      # byebug

      expect(page).not_to have_button 'Update Restaurant'
      expect(page).to have_content 'You can only....'


  end


end
