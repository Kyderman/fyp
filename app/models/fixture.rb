class Fixture < ActiveRecord::Base
  has_many :scores
  has_many :teams, through: :scores
  accepts_nested_attributes_for :scores, reject_if: :all_blank
  belongs_to :competition

  def mark_as_complete
    update_attributes(is_complete: true) if scores.find_by(points: nil).nil?
  end

  def home_team
    @home_team = scores.find_by(is_home: true).team
    @home_team
  end

  def away_teams
    @away_team = scores.find_by(is_home: false).team
    @away_team
  end
end
