class Competition < ActiveRecord::Base
  has_many :teams_competitions, dependent: :destroy
  has_many :teams, through: :teams_competitions
  accepts_nested_attributes_for :teams_competitions, reject_if: :all_blank,
                                              allow_destroy: true

  has_many :users, source: :members, through: :teams

  belongs_to :owner, class_name: 'User'

  belongs_to :competition_format, polymorphic: true, dependent: :destroy

  has_many :competition_shouts, dependent: :destroy

  has_many :fixtures, dependent: :destroy
  has_many :upcoming_fixtures, -> { where(fixtures: { is_complete: false }).order(:round) },
           class_name: 'Fixture'
  has_many :results, -> { where(fixtures: { is_complete: true }) },
           class_name: 'Fixture'

  belongs_to :sport

  def update_progression(fixture)
    if self.competition_format_type == 'League'
      competition_format.calculate_result(fixture)
    end
  end

  def self.search(search, sport)

    res = Competition.where("name ILIKE ?", "%#{search}%")

    if !sport.empty?
      res = res.where(sport: sport)
    end
    return res
  end
end
