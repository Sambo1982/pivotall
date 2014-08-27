class AddPivotalAccountIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pivotal_account_id, :string
  end
end
