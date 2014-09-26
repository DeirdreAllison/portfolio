# Rails.env = 'test'
puts "Current environment: #{Rails.env}"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'
require 'minitest/pride'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # include js: true before do and require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist
  Capybara.ignore_hidden_elements = false

  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: users(:one).email
    fill_in 'Password', with: users(:one).password
    click_on 'Log in'

    visit new_article_path
  end
end
