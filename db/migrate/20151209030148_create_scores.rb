class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :team_id
      t.string :fixture_id

      t.timestamps null: false
    end
  end
end
