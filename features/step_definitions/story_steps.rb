Given(/^a project exists$/) do
  @project = Project.create(name: "my_project")
end

Given(/^I'm on that project page$/) do
  visit project_url(@project.id)
end

When(/^I click "(.*?)"$/) do |text|
  click_on text
end

When(/^I fill in the story form$/) do
  fill_in :story_goal, with: "My goal"
  fill_in :story_stakeholder, with: "stakeholder"
  fill_in :story_behavior, with: "behavior"
  select("0", :from => :story_business_value)
  select("1", :from => :story_complexity_value)
  select("Unstarted", :from => :story_status_id)
end

Then(/^I see the story in the story list$/) do
  visit stories_url
  page.should have_content "My goal"
end

Given(/^status records exist$/) do
  Status.create(name: "In Progress")
  Status.create(name: "Unstarted")
end

Given(/^a story exists$/) do
  @story = Story.create(
    goal: "goal",
    stakeholder: "stakeholder",
    behavior: "behavior",
    business_value: 1,
    complexity_value: 1,
    status_id: 7
  )
end

Then(/^I see story in the edit page$/) do
  visit edit_story_url @story
end

Then(/^I change the "(.*?)" field to "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

Then(/^I select "(.*?)" for "(.*?)"$/) do |value, field|
  select(value, :from => field)
end

Then(/^I see the updated values in the edit story page$/) do
  visit edit_story_url @story
  find_field('story_goal').value.should eq "changed goal"
  find_field('story_stakeholder').value.should eq "changed stakeholder"
  find_field('story_behavior').value.should eq "changed behavior"
  page.should have_content "1"
  page.should have_content "2"
end
