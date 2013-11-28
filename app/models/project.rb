class Project < ActiveRecord::Base
  after_save :create_iteration
  belongs_to :user
	has_many :stories, -> { order(:position) } do
    def icebox
      where("iteration_id = 0")
    end
  end
  
  has_many :iterations do
    def current
      where("current = true").first
    end
    def manageable
      where("iterations.id != 0 and current = false" )
    end
  end

  private
  def create_iteration
    iteration = Iteration.create(:project_id => self.id)
  end
end
