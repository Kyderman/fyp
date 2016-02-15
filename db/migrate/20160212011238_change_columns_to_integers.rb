class ChangeColumnsToIntegers < ActiveRecord::Migration
  def change
    change_column :scores, :team_id, 'integer USING CAST(team_id AS integer)'
    change_column :scores, :fixture_id, 'integer USING CAST(fixture_id AS integer)'
    change_column :fixtures, :competition_id, 'integer USING CAST(competition_id AS integer)'
  end
end
