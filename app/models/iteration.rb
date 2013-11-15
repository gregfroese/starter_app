class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :stories, -> { order(:position) }
  validates :name, presence: true

  def set_current project
    project.iterations.where("current = ?", true).each do |iteration|
      iteration.current = false
      iteration.save
    end
    self.current = true
    self.save
  end
end
