class TeamsCompetition < ActiveRecord::Base
  belongs_to :competition
  belongs_to :team
end
