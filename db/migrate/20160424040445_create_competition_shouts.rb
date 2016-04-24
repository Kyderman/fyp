class CreateCompetitionShouts < ActiveRecord::Migration
  def change
    create_table :competition_shouts do |t|
      t.integer :competition_id
      t.integer :user_id
      t.string :body

      t.timestamps null: false
    end
  end
end
