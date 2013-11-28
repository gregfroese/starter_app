class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :stories, -> { order(:position) } do
    def business_value
      business_value = 0
      map{|s| business_value += s.business_value}
      business_value
    end
    def complexity_value
      complexity_value = 0
      map{|s| complexity_value += s.complexity_value}
      complexity_value
    end
  end
  validates :name, presence: true

  def set_current project
    project.iterations.where("current = ?", true).where("id != ?", self.id).each do |iteration|
      iteration.current = false
      iteration.save
    end
    self.current = true
    self.save
  end
end
