require 'spec_helper'

describe Story do
  before(:each) {
    story = Story.new
    story.goal = nil
  }

  describe "story validation" do
    it "has a goal" do
      expect(story.goal).to eq("goal")
    end
  end
end
