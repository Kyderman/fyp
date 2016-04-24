class Team < ActiveRecord::Base
  has_many :users_teams
  accepts_nested_attributes_for :users_teams, reject_if: :all_blank,
                                              allow_destroy: true
  has_many :members, class_name: 'User', through: :users_teams, source: 'user'
  has_many :owners,-> { where(users_teams: { is_owner: true }) },
           class_name: 'User',
           through: :users_teams,
            source: 'user'
  has_many :teams_competitions
  has_many :competitions, through: :teams_competitions
  has_many :team_shouts
  belongs_to :sport

  def upcoming_fixtures
    c_count = competitions.count
    from_each = c_count % 5
    competitions.each do |c|
    end
  end

  def recent_results
    c_count = competitions.count
    from_each = c_count % 5
    competitions.each do |c|
    end
  end
end
