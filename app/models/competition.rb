class Competition < ActiveRecord::Base
  has_many :teams, through: :teams_competitions

  has_many :users, source: :members, through: :teams

  belongs_to :owner, class_name: 'User'

  belongs_to :competition_format, polymorphic: true

  has_many :fixtures

  belongs_to :sport
end
