class AddIceboxIterations < ActiveRecord::Migration
  def change
    Project.all.each do |p|
      if p.iterations.icebox == nil
        Iteration.create(name: "Icebox", icebox: true, project_id: p.id)
      end
    end
  end
end
