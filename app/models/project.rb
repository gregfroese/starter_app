class Project < ActiveRecord::Base
  after_save :create_iteration
	has_many :stories, :order => "position"
  has_many :iterations

  private
  def create_iteration
    iteration = Iteration.create(:project_id => self.id)
  end
end
