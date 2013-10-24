class Story < ActiveRecord::Base
  validates :goal, presence: true
  validates :stakeholder, presence: true
  validates :behavior, presence: true
  validates :business_value, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }

  has_one :status
end
