class AddUsersToModels < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer, :default => 0
    add_column :stories, :user_id, :integer, :default => 0
    add_column :criteria, :user_id, :integer, :default => 0
    add_column :comments, :user_id, :integer, :default => 0
  end
end
