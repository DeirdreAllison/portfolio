require 'test_helper'

class CheckForZurbTest < Capybara::Rails::TestCase
  test 'zurb foundation is being used' do
    visit root_path
    page.has_css?('toggle-topbar menu-icon')
  end
end
