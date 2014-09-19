require "test_helper"

class VisitArticleIndexTest < Capybara::Rails::TestCase
  test "article index has posts" do
    Article.create(title: "Welcome to my new blog",
                body: "Do you like it?")
    visit articles_path
    page.text.must_include "Welcome to my new blog"
  end
end
