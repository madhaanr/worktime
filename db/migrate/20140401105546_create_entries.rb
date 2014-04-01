class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date_when_done
      t.float :hours_done
      t.string :description
      t.integer :user_id
      t.integer :project_id
      t.integer :task_id

      t.timestamps
    end
  end
end
