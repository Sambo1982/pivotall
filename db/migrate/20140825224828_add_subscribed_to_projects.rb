class AddSubscribedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :subscribe, :boolean
  end
end
