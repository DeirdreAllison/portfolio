require 'test_helper'

feature 'As an editor or author, I want to be able to edit articles and ensure that viewers cannot' do
  scenario 'Author can edit the article' do
    sign_in(:author)
    visit new_article_path
    article = Article.create(title: 'Another post', body: 'Guess what? Another post')
    visit article_path(article)
    click_on 'Edit'
    fill_in 'Title', with: 'This is a post'
    click_on 'Update Article'
    page.text.must_include 'Article was successfully updated'
    page.text.must_include 'This is a post'
  end

  scenario 'Editor can edit the article' do
    sign_in(:editor)
    visit new_article_path
    article = Article.create(title: 'Another post', body: 'Guess what? Another post')
    visit article_path(article)
    click_on 'Edit'
    fill_in 'Title', with: 'This is a post'
    click_on 'Update Article'
    page.text.must_include 'Article was successfully updated'
    page.text.must_include 'This is a post'
  end
end
