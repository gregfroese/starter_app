class AddNameToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :name, :string
  end
end
