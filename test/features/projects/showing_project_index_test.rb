require 'test_helper'

feature 'See the portfolio index' do
 scenario 'viewing portfolio index' do
   visit projects_path
   page.text.must_include 'Awesome Project'
 end
end
