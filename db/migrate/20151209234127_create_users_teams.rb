class CreateUsersTeams < ActiveRecord::Migration
  def change
    create_table :users_teams do |t|
      t.integer :user_id
      t.integer :team_id
      t.boolean :is_owner

      t.timestamps null: false
    end
  end
end
