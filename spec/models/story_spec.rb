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
end
