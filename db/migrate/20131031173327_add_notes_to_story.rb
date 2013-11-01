class AddNotesToStory < ActiveRecord::Migration
  def change
    add_column :stories, :notes, :text
  end
end
