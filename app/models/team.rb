class Team < ActiveRecord::Base
  has_many :users_teams
  has_many :members, class_name: 'User', through: :users_teams
  has_many :owners,
           -> { where(members: { is_owner: true }) }, class_name: 'User',
           through: :members
  has_many :teams_competitions
  has_many :competitions, through: :teams_competitions
end
