class Project < ActiveRecord::Base
  after_save :create_iteration
  belongs_to :user
	has_many :stories, -> { order(:position) }
  
  has_many :iterations do
    def current
      where("current = true").first
    end
    def manageable
      where("current = false" )
    end
    def icebox
      where("icebox = true").first
    end
  end

  private
  def create_iteration
    iteration = Iteration.create(:project_id => self.id)
  end
end
