class AddOwnerToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :owner_id, :integer
  end
end
