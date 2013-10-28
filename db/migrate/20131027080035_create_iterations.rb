class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.integer :project_id
      t.timestamps
    end
  end
end
