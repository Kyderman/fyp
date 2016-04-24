class AddOldScoresToScores < ActiveRecord::Migration
  def change
    add_column :scores, :old_points, :integer
  end
end
