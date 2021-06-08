class RemoveUserIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :user_id
  end
end
