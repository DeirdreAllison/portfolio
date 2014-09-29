require 'test_helper'

feature 'As an author, I want to be sure only authorized people can write articles' do
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

  scenario 'unauthenticated site visitors cannot visit new_article_path' do
    visit new_article_path
    page.must_have_content 'You need to sign in or sign up before continuing'
  end

  scenario 'unauthenticated site visitors cannot see new article button' do
    visit articles_path
    page.wont_have_link 'New Article'
  end

  scenario 'authors cannot publish' do
    sign_in(:author)
    visit new_article_path
    page.wont_have_field('published')
  end

  scenario 'editors can publish' do
    sign_in(:editor)
    visit new_article_path
    page.must_have_field('Unpublished')
    fill_in 'Title', with: articles(:da).title
    fill_in 'Body', with: articles(:da).body
    check 'Published'
    click_on 'Create Article'
    page.text.must_include 'Status: Published'
  end
end
