class AddUserToWorkspace < ActiveRecord::Migration[6.0]
  def change
    add_reference :workspaces, :user, foreign_key: true
  end
end
