class Criterium < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  has_many :comments

  validates :details, presence: true
end
