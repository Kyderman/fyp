class CreateTeamShouts < ActiveRecord::Migration
  def change
    create_table :team_shouts do |t|
      t.integer :team_id
      t.integer :user_id
      t.string :body

      t.timestamps null: false
    end
  end
end
