class AddFieldsToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :maximum_teams, :integer
    add_column :competitions, :closing_date, :datetime
    add_column :competitions, :is_underway, :boolean, default: false
  end
end
