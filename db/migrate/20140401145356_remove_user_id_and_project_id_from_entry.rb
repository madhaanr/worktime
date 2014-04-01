class RemoveUserIdAndProjectIdFromEntry < ActiveRecord::Migration
  def change
    remove_column :entries, :user_id, :integer
    remove_column :entries, :project_id, :integer
  end
end
