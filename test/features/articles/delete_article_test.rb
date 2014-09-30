require 'test_helper'

feature 'As an editor I want to delete articles and ensure authors and viewers cannot' do
  scenario 'Delete article' do
    sign_in(:editor)
    visit articles_path
    page.must_have_content 'Destroy'
  end

  scenario 'authors cannot delete' do
    sign_in(:author)
    visit new_article_path
    fill_in 'Title', with: articles(:da).title
    fill_in 'Body', with: articles(:da).body
    click_on 'Create Article'
    visit articles_path
    page.wont_have_content 'Destroy'
  end
end
