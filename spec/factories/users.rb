# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "rspec"
    uid "23lkjasf"
    name "Tester McTesty"
    roles ["User"]
  end
end
