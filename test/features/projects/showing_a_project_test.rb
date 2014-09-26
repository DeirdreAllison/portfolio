require 'test_helper'

feature 'Show a project' do
  scenario 'should show a single project' do
    visit projects_path(projects(:testproject))
    page.text.must_include 'Awesome Project'
  end
end
