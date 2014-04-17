class AddIndex < ActiveRecord::Migration
  def change
    add_index :user_projects, [:user_id,:project_id], unique: true, name: "by_user_and_project"
  end
end
