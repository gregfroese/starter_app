class AddPositionToStories < ActiveRecord::Migration
  def change
    add_column :stories, :position, :integer, :default => 0
  end
end
