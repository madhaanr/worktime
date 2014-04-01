class AddUserProjectIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :user_project_id, :integer
  end
end
