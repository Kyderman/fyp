class AddIsIndividualToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :is_individual, :boolean
  end
end
