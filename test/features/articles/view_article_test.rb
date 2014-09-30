require 'test_helper'

feature 'As a visitor, author or editor I want to only see what I amd supposed to' do
  scenario 'write an article' do
    sign_in(:author)
    visit new_article_path
    fill_in 'Title', with: articles(:da).title
    fill_in 'Body', with: articles(:da).body
    click_on 'Create Article'
    page.text.must_include 'Article was successfully created'
    page.text.must_include articles(:da).title
    page.has_css? '#author'
    page.text.must_include 'Status: Unpublished'
  end

  scenario 'article index has posts' do
    visit articles_path
    page.text.must_include 'Title'
    page.text.wont_include 'Edit'
    page.text.wont_include 'Unpublished'
  end

  # scenario 'authors can only see their own posts' do
  #   sign_in(:author)
  #   visit articles_path
  #   page.text.must_include @article.author
  # end

  # scenario 'editors can view all posts' do
  #   sign_in(:editor)
  #   visit articles_path
  #   page.text.must_include articles.all
  # end
end
