class Competition < ActiveRecord::Base
  has_many :teams_competitions
  has_many :teams, through: :teams_competitions
  accepts_nested_attributes_for :teams_competitions, reject_if: :all_blank,
                                              allow_destroy: true

  has_many :users, source: :members, through: :teams

  belongs_to :owner, class_name: 'User'

  belongs_to :competition_format, polymorphic: true

  has_many :fixtures
  has_many :upcoming_fixtures, -> { where(fixtures: { is_complete: false }) },
           class_name: 'Fixture'
  has_many :results, -> { where(fixtures: { is_complete: true }) },
           class_name: 'Fixture'

  belongs_to :sport
end
