class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :project_id
      t.string :external_id
      t.string :external_project_id
      t.string :name
      t.string :description
      t.string :story_type
      t.string :current_state
      t.float :estimate
      t.datetime :accepted_at
      t.datetime :deadline
      t.string :requested_by_id

      t.timestamps
    end
  end
end
