require 'test_helper'

feature 'Delete a project' do
  scenario 'successfully delete project' do
    visit projects_path(projects(:testproject))
    page.text.must_include 'Awesome Project'
    click_on 'Delete'
    page.text.wont_include 'Awesome Project'
  end
end
