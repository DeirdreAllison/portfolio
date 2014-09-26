require 'test_helper'

class WriteArticleTest < Capybara::Rails::TestCase
  test 'write an article' do
    sign_in
    visit articles_path
    click_on 'New Article'
    fill_in 'Email', with: users(:one).email
    fill_in 'Password', with: users(:one).password
    click_on 'Log in'
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
