class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.float :work_hour_budget
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
