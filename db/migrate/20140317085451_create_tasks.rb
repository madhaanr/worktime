class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.float :hour_budget
      t.integer :project_id

      t.timestamps
    end
  end
end
