class Story < ActiveRecord::Base
  acts_as_ordered_taggable
  acts_as_list :scope => :iteration
  
  validates :goal, presence: true
  validates :stakeholder, presence: true
  validates :behavior, presence: true
  validates :business_value, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }
  validates :complexity_value, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }

  has_many :assignments
  has_many :users, through: :assignments

  belongs_to :project
  belongs_to :status
  belongs_to :iteration
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :comments
  has_many :criteria, class_name: "Criterium" do
    def dev_test_solved
      where("dev_test = true")
    end
    def dev_test_unsolved
      where("dev_test = false")
    end
    def functional_test_solved
      where("functional_test = true")
    end
    def functional_test_unsolved
      where("functional_test = false")
    end
  end

  def self.allByPriority
    Story.all.sort_by(&:priority).reverse
  end

  def self.storiesInIterationByPriority iteration_id
    Story.where(iteration_id: iteration_id).sort_by(&:priority).reverse
  end

  def priority
    return business_value if complexity_value == 0
    (business_value.to_f / complexity_value.to_f).to_f
  end
end
