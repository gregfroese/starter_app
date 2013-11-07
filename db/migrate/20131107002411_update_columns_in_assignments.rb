class UpdateColumnsInAssignments < ActiveRecord::Migration
  def change
    remove_column :assignments, :story_id
    add_column :assignments, :assigned_story_id, :integer
  end
end
