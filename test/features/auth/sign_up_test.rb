require 'test_helper'

feature 'As a visitor I want to login so I know I am safe' do
  scenario 'sign up' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign Up'
    page.wont_have_content 'We were not able to sign you up'
  end

  scenario 'sign in with twitter works' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:twitter, uid: '12345', info:
                            { nickname: 'test_twitter_user' })
    visit root_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    # on 'Sign in with Twitter'
    # page.must_have_content 'Logged in as'
  end
end
