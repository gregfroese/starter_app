class AddIceboxToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :icebox, :boolean, default: false
  end
end
