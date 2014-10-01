require 'test_helper'

feature 'As a site visitor I want to comment on articles to share my opinion' do
  scenario 'Visitor can see comments' do
    visit articles_path(articles(:article_1))
    click_on 'Show'
    page.text.must_include 'Comments'
  end

  scenario 'Visitor can write comments' do
    visit articles_path(articles(:article_1))
    click_on 'Show'
    fill_in 'Author', with: 'John Doe'
    fill_in 'Content', with: 'This is a comment'
    click_on 'Create Comment'
    page.text.must_include 'Post submitted for approval'
  end
end
feature 'As an author or editor I want to approve comments to prevent spam' do
  scenario 'editor approves comment' do
    sign_in(:editor)
    visit article_path(articles(:article_1))
    page.text.must_include 'Approved'
    end

  scenario 'author approves comment' do
    sign_in(:author)
    visit articles_path(articles(:article_1))
    click_on 'Show'
    page.text.must_include 'Approved'
    end
end
