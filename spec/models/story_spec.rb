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

  describe "reset sort order" do
    it "should resort stories based on priority" do
      @stories = []
      @status_one = Status.create(name: "nothing")
      @project = Project.create(name: "name")
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
      @stories << Story.create(
        goal: "goal",
        stakeholder: "stakeholder",
        behavior: "story 4",
        status_id: @status_one.id,
        business_value: 4,
        complexity_value: 2,
        project_id: @project.id,
        position: 0,
        iteration_id: @project.iterations.last.id
      )

      sorted = Story.storiesInIterationByPriority 0
      sorted.size.should eq 3
      sorted[0].behavior.should eq "story 3"
      sorted[1].behavior.should eq "story 1"
      sorted[2].behavior.should eq "story 2"

    end
  end
end
