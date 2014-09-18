require "test_helper"

class VisitArticleIndexTest < Capybara::Rails::TestCase
  test "article index has posts" do
    # Given posts
    Article.create(title: "Welcome to my new blog",
                body: "Do you like it?")
    # When path is visited
    visit articles_path
    #Exisiting posts should be there
    page.text.must_include "Welcome to my new blog"
  end
end
