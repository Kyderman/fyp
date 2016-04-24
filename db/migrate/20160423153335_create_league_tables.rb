class CreateLeagueTables < ActiveRecord::Migration
  def change
    create_table :league_tables do |t|
      t.integer :league_id
      t.integer :team_id
      t.integer :position
      t.integer :played, default: 0
      t.integer :won, default: 0
      t.integer :drawn, default: 0
      t.integer :lost, default: 0
      t.integer :for_scored, default: 0
      t.integer :against, default: 0
      t.integer :difference, default: 0
      t.integer :points, default: 0

      t.timestamps null: false
    end
  end
end
