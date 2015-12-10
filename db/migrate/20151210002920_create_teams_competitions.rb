class CreateTeamsCompetitions < ActiveRecord::Migration
  def change
    create_table :teams_competitions, id: false do |t|
      t.integer :team_id
      t.integer :competition_id
    end
  end
end
