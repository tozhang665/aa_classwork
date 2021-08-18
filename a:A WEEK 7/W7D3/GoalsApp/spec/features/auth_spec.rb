# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do
    visit new_user_path
  end
  
  scenario 'has a new user sign up page' do
    expect(page).to have_content('Sign Up')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup'do
      fill_in 'Username',with: 'tony'
      fill_in 'Password', with: 'password'

      click_button 'Sign Up'
      save_and_open_page
      visit users_path
      expect(page).to have_content('tony')
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'do
    
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'do
    
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    
  end

end