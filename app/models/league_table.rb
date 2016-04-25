class LeagueTable < ActiveRecord::Base
  belongs_to :league, dependent: :destroy
  belongs_to :team
end
