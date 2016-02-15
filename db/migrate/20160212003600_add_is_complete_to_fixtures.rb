class AddIsCompleteToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :is_complete, :boolean, default: false
  end
end
