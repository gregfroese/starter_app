Given(/^I'm on the story index page$/) do
  visit stories_url
end

When(/^I click "(.*?)"$/) do |text|
  click_on text
end

When(/^I fill in the story form$/) do
  fill_in :story_goal, with: "My goal"
  fill_in :story_stakeholder, with: "stakeholder"
  fill_in :story_behavior, with: "behavior"
  select(0, :from => :story_business_value)
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

