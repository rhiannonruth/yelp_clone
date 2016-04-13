require 'rails_helper'
require_relative 'facebook_helper'

feature 'facebook authentication', js: false do
  scenario 'log in with valid facebook account succeeds' do
    visit '/'
    set_omniauth
    click_link('Sign in with Facebook')
    expect(page).to have_content('Successfully authenticated from Facebook account')
  end

  scenario 'log in with invalid facebook account fails', js: false do
    visit '/'
    set_invalid_omniauth
    click_link('Sign in with Facebook')
    expect(page).not_to have_content('Successfully authenticated from Facebook account')
  end
end
