require "test_helper"

class EditArticleTest < Capybara::Rails::TestCase
  test "Editing the article" do
    article = Article.create(title: "Another post", body: "Guess what? Another post")
    visit article_path(article)
    click_on "Edit"
    fill_in "Title", with: "This is a post"
    click_on "Update Article"
    page.text.must_include "Article was successfully updated"
    page.text.must_include "This is a post"
  end
end
