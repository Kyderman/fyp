class AddIsHomeToScores < ActiveRecord::Migration
  def change
    add_column :scores, :is_home, :boolean
  end
end
