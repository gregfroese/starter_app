class AddIterationIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :iteration_id, :integer, :default => 0
  end
end
