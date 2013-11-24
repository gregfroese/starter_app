class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :stories, -> { order(:position) }
  validates :name, presence: true

  def set_current project
    project.iterations.where("current = ?", true).where("id != ?", self.id).each do |iteration|
      iteration.current = false
      iteration.save
    end
    puts "========="
    puts self.current
    self.current = true
    self.save
    puts self.current
  end
end
