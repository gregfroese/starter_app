require 'spec_helper'

describe Story do
  let(:story) { Story.new }
  let(:goal) { "goal" }

  before(:each) {
    story.goal = goal
    story.stakeholder = "stakeholder"
    story.behavior = "behavior"
  }

  describe "story validation" do
    let(:goal) { nil }

    it "has a goal" do
      expect {
        story.valid?.to be_false
      }
    end
  end

  describe "priority" do 
    it "is the ratio of business value to complexity value" do
      story.business_value = 5
      story.complexity_value = 2
      story.priority.should eq 2.5
    end

    it "should be the business value if complexity value is 0" do
      story.business_value = 3
      story.complexity_value = 0
      story.priority.should eq 3
    end

    it "should be 0 if business value is 0" do
      story.business_value = 0
      story.complexity_value = 5
      story.priority.should eq 0
    end
  end
end
