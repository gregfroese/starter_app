Given(/^I am on the project list page$/) do
  visit root_url
end

When(/^I click the "(.*?)" link$/) do |text|  
  click_on text
end

When(/^fill in the "(.*?)" field with "(.*?)"$/) do |name, value|
  fill_in(name, :with => 'value')
end

When(/^click the "(.*?)" button$/) do |text|
  click_on text
end

Then(/^I see "(.*?)"$/) do |text|
  page.has_content?(text)
end
