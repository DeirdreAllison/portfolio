require "test_helper"

class CheckForZurbTest < Capybara::Rails::TestCase
  test "zurb foundation is being used" do
    visit root_path
    page.body.must_include "foundation_and_overrides"
  end
end
