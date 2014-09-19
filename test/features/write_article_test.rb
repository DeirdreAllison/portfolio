require "test_helper"

class WriteArticleTest < Capybara::Rails::TestCase
  test "write an article" do
    visit new_article_path
    fill_in "Title", with: articles(:da).title
    fill_in "Body", with: articles(:da).body
    click_on "Create Article"
    page.text.must_include "Article was successfully created"
    page.text.must_include articles(:da).title

  end
end
