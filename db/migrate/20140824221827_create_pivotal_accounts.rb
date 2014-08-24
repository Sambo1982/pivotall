class CreatePivotalAccounts < ActiveRecord::Migration
  def change
    create_table :pivotal_accounts do |t|
      t.string :user_id
      t.string :api_key

      t.timestamps
    end
  end
end
