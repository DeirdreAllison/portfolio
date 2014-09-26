require 'test_helper'

class WriteArticleTest < Capybara::Rails::TestCase
  test 'write an article' do
    sign_up
    save_and_open_page
    fill_in 'Title', with: articles(:da).title
    fill_in 'Body', with: articles(:da).body
    click_on 'Create Article'
    page.text.must_include 'Article was successfully created'
    page.text.must_include articles(:da).title
    page.has_css? '#author'
    page.text.must_include users(:one).email
  end
end
