class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :goal
      t.text :stakeholder
      t.text :behavior
      t.integer :business_value
      t.integer :complexity_value
      t.integer :status_id
      t.timestamps
    end
  end
end
