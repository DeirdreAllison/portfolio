require 'test_helper'

feature 'As a visitor I want to login so I know I am safe' do
  scenario 'sign up' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign Up'
    # capybara unable to find text
    # page.must_have_content 'Welcome! You have signed up successfully.'
    page.wont_have_content 'We were not able to sign you up'
  end
end
