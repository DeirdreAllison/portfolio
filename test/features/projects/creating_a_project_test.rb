require 'test_helper'

feature 'Create a new project' do
  scenario 'successfully create project' do
    visit projects_path
    click_on 'Create New Project'
    fill_in 'Name', with: 'test project'
    fill_in 'Description', with: 'all about the test project'
    click_on 'Create Project'
    page.text.must_include 'Project has been created'
    page.text.must_include 'all about the test project'
  end

  scenario 'project submitted with incorrect data' do
    visit projects_path
    click_on 'Create New Project'
    click_on 'Create Project'
    current_path.must_match(/projects$/)
    page.text.must_include 'Project could not be saved'
    page.text.must_include 'Name field must be filled out'
    page.text.wont_include 'Project has been created'
  end
end
