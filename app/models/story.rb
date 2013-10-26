class Story < ActiveRecord::Base
  acts_as_ordered_taggable
  acts_as_list :scope => :project
  
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

  belongs_to :project
  belongs_to :status
  has_many :comments

  def self.allByPriority
    Story.all.sort_by(&:priority).reverse
  end

  def priority
    return business_value if complexity_value == 0
    (business_value.to_f / complexity_value.to_f).to_f
  end
end
