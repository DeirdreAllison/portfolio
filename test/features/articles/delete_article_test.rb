require 'test_helper'

class DeleteArticleTest < Capybara::Rails::TestCase
  test 'Delete article' do
    Article.create(title: 'Extra special post',
                   body: 'This is the most awesome post yet')
    visit articles_path
    page.find('tr:last td a:last', text: 'Destroy').click
    page.wont_have_content 'Extra special post'
  end
end
