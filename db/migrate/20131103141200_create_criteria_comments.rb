class CreateCriteriaComments < ActiveRecord::Migration
  def change
    create_table :criteria_comments do |t|
      t.integer :criterium_id, default: 0
      t.text :message
      t.timestamps
    end
  end
end
