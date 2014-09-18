require "test_helper"

class DeleteArticleTest < Capybara::Rails::TestCase
  test "Delete article" do
    # Article.create(title: "Extra special post",
    #                body: "This is the most awesome post yet")
    visit articles_path
    click_on "Destroy"
    page.wont_have_content "person who created"
  end
end
