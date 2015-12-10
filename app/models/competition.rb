class Competition < ActiveRecord::Base
  has_many :teams, through: :teams_competitions
  belongs_to :competition_format, polymorphic: true
  has_many :fixtures
end
