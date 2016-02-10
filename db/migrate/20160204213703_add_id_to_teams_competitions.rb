class AddIdToTeamsCompetitions < ActiveRecord::Migration
  def change
    add_column :teams_competitions, :id, :primary_key
  end
end
