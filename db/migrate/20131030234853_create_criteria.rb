class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.text :details
      t.boolean :solved
      t.integer :story_id
      t.timestamps
    end
  end
end
