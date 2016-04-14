module UserHelpers

  def user_sign_up(user)
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password_confirmation)
    click_button('Sign up')
  end

  def user_sign_in(user)
    visit('/')
    click_link 'Sign in'
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button 'Log in'
  end

  def link_restaurant_and_user(user, restaurant)
    restaurant.user = user
    restaurant.save
  end

end
