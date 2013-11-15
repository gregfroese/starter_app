class AddCurrentFlagToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :current, :boolean, default: false
    add_column :iterations, :start_date, :date
    add_column :iterations, :end_date, :date
  end
end
