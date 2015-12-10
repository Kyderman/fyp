class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :sport_id
      t.integer :competition_format_id
      t.string :competition_format_type

      t.timestamps null: false
    end
  end
end
