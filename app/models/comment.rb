class Comment < ActiveRecord::Base
  belongs_to :criterium
  belongs_to :user
end
