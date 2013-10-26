class Project < ActiveRecord::Base
	has_many :stories, :order => "position"
end
