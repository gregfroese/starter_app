Given(/^I am on the project list page$/) do
  visit projects_path
end

When(/^I click the "(.*?)" link$/) do |text|  
  click_on text
end

When(/^fill in the "(.*?)" field with "(.*?)"$/) do |name, value|
  fill_in(name, :with => value)
end

When(/^click the "(.*?)" button$/) do |text|
  click_on text
end

Then(/^I see "(.*?)"$/) do |text|
  page.should have_content text
end

Then(/^I expect to see (\d+) iterations on the project page$/) do |arg1|
  visit projects_path
  page.should have_content "Iteration stories: 0"
end

Given(/^I have a project stories in the current iteration$/) do
  @project = Project.create(name: "name")
  @stories = []
  @status ||= Status.create(name: "status")

  story = Story.create(
    goal: "story 1",
    stakeholder: "stakeholder",
    behavior: "behavior",
    business_value: 1,
    complexity_value: 1,
    status_id: @status.id,
    project_id: @project.id,
    position: 0,
    iteration_id: @project.iterations.last.id
  )
  @stories << story

  story.goal = "story 2"
  @stories << story
  
  story.goal = "story 3"
  @stories << story

  story.goal = "story 4"
  @stories << story
end

Given(/^I have a project with a list of stories$/) do
  @project = Project.create(name: "name")
  @stories = []
  @status ||= Status.create(name: "status")

  story = Story.create(
    goal: "story 1",
    stakeholder: "stakeholder",
    behavior: "behavior",
    business_value: 1,
    complexity_value: 1,
    status_id: @status.id,
    project_id: @project.id,
    position: 0,
    iteration_id: 0
  )
  @stories << story
  @first_story = story

  story.goal = "story 2"
  @stories << story
  
  story.goal = "story 3"
  @stories << story

  story.goal = "story 4"
  @stories << story
end

When(/^I view the project current iteration page$/) do
  visit current_project_stories_path @project
end

Then(/^I expect to see all stories in the icebox view$/) do
  page.should_not have_content "In order to"
  visit icebox_project_stories_path @project
  page.should have_content "In order to"
end

When(/^I view the project icebox page$/) do
  visit icebox_project_stories_path @project
end

When(/^I visit the project list$/) do
  visit projects_path
end

Given(/^there is no project named "(.*?)"$/) do |name|
  visit projects_path
  page.should_not have_content "Jiri"
end

When(/^I view the project page$/) do
  visit project_path @project
end

When(/^I find "(.*?)" and click "(.*?)"$/) do |element, link_or_button|
  id = element + "_" + @first_story.id.to_s
  puts "LOOKING FOR " + id
  find(id).click_on link_or_button
end
