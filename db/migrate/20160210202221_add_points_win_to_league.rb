class AddPointsWinToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :win_points, :integer
  end
end
