# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    goal "goal"
    stakeholder "stakeholder"
    behavior "behavior"
    complexity_value 1
    business_value 3
    iteration_id 0
    project
  end
end
