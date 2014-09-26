require 'test_helper'

feature 'Editing a project' do
  scenario 'edit a project' do
    visit edit_project_path(projects(:testproject))
    fill_in 'Name', with: 'official project'
    click_on 'Update Project'
    page.text.must_include 'Changes successfully saved'
    page.text.must_include 'official project'
    page.text.wont_include 'test project'
  end

  scenario 'edit a project' do
    visit edit_project_path(projects(:testproject))
    fill_in 'Name', with: ' '
    click_on 'Update Project'
    page.text.must_include 'Changes not saved'
  end
end
