  Given(/^a project exists$/) do
  @project = Project.create(name: "my_project")
end

Given(/^I'm on that project page$/) do
  visit project_path(@project.id)
end

When(/^I click "(.*?)"$/) do |link_or_button|
  click_on link_or_button
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
  page.should have_content "behavior"
end

Given(/^status records exist$/) do
  @status_one = Status.create(name: "In Progress")
  @status_two = Status.create(name: "Unstarted")
end

Given(/^a story exists$/) do
  @project = Project.create()
  @status = Status.first
  @story = Story.create(
    goal: "goal",
    stakeholder: "stakeholder",
    behavior: "behavior",
    business_value: 1,
    complexity_value: 1,
    status_id: @status.id,
    project_id: @project.id,
    position: 0,
    iteration_id: 0
  )
end

Then(/^I see story in the edit page$/) do
  visit edit_project_story_path @project, @story
end

Then(/^I change the "(.*?)" field to "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

Then(/^I select "(.*?)" for "(.*?)"$/) do |value, field|
  select(value, :from => field)
end

Then(/^I see the updated values in the edit story page$/) do
  visit edit_project_story_path @project, @story
  find_field('story_goal').value.should eq "changed goal"
  find_field('story_stakeholder').value.should eq "changed stakeholder"
  find_field('story_behavior').value.should eq "changed behavior"
  page.should have_content "1"
  page.should have_content "2"
end

When(/^I view the story$/) do
  visit project_story_path @project, @story
end

When(/^I view the manage page$/) do
  visit manage_project_path @project
end

When(/^I enter a comment$/) do
  fill_in :comment_message, with: "My comment"
end

Then(/^I see the comment$/) do
  visit project_story_path @project, @story
  page.should have_content "My comment"
end

Given(/^I'm on the project story list$/) do
  visit project_path @project
end

When(/^I have a list of stories$/) do
  @project = Project.create(name: "Project 1")

  @stories = []
  @stories << Story.create(
    goal: "goal",
    stakeholder: "stakeholder",
    behavior: "story 1",
    status_id: @status_one.id,
    business_value: 3,
    complexity_value: 2,
    project_id: @project.id,
    position: 0,
    iteration_id: 0
  )
  @stories << Story.create(
    goal: "goal",
    stakeholder: "stakeholder",
    behavior: "story 2",
    status_id: @status_one.id,
    business_value: 1,
    complexity_value: 3,
    project_id: @project.id,
    position: 0,
    iteration_id: 0
  )
  @stories << Story.create(
    goal: "goal",
    stakeholder: "stakeholder",
    behavior: "story 3",
    status_id: @status_one.id,
    business_value: 4,
    complexity_value: 2,
    project_id: @project.id,
    position: 0,
    iteration_id: 0
  )
  @expected_order = ["story 3", "story 1", "story 2"]

end

When(/^I visit the story list page$/) do
  visit project_path @project
end

Then(/^I want to see stories sorted in order of priority$/) do
  actual_order = page.all(:css, 'div.story-details--behavior---text').map { |a| a.text }
  actual_order.should == @expected_order
end

When(/^I edit a story$/) do
  visit edit_project_story_path @project, @story
end

Then(/^"(.*?)" contains "(.*?)"$/) do |field, value|
  find_field(field).value.should eq value
end

When(/^I visit the project icebox$/) do
  visit icebox_project_stories_path @project
end

Then(/^the stories are in the expected order$/) do
  stories = @project.stories - @project.iterations.last.stories

  stories[0].id.should == 3
  stories[1].id.should == 1
  stories[2].id.should == 2
end

Given(/^I view the story page$/) do
  visit project_story_path @project, @story
end

When(/^I add acceptance criteria$/) do
  fill_in :criterium_details, with: "new acceptance criteria!"
end

Then(/^I see the acceptance criteria on the show page$/) do
  visit project_story_path(@project, @story)
  page.should have_content "new acceptance criteria!"
end

Then(/^I see "(.*?)" on the page$/) do |text|
  page.should have_content(text)
end

Then(/^I add a criteria comment$/) do
  find(".criteria-comments").find(".fa-microphone").click
  fill_in "comment[message]", with: "new criteria comment"
end

Then(/^I see my comment on the show page$/) do
  visit project_story_path(@project, @story)
  find(".criteria-comments").find(".fa-microphone").click
  page.should have_content "new criteria comment"
end