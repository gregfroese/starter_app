class Criterium < ActiveRecord::Base
  belongs_to :story
  has_many :comments
end
