require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  test "visit the home page" do
    visit root_path
    assert_content page, "deirdreallison.com"
  end
end
