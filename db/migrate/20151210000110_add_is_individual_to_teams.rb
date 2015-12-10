class AddIsIndividualToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :is_individual, :boolean
  end
end
