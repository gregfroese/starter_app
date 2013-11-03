class CleandUpComments < ActiveRecord::Migration
  def change
    drop_table :criteria_comments
    remove_column :comments, :story_id
    add_column :comments, :criterium_id, :integer
  end
end
