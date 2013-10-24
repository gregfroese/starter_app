class RelateProjectsToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :project_id, :integer, :default => 0
  end
end
