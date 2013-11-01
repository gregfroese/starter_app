class UpdateCriteriaWithFunctionalStatus < ActiveRecord::Migration
  def change
    remove_column :criteria, :solved
    add_column :criteria, :dev_test, :boolean
    add_column :criteria, :functional_test, :boolean
  end
end
