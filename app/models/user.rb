class User < ActiveRecord::Base
  enum role: [:user, :admin]
  #after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :passive_friendships, class_name: 'Friendship',
                                 foreign_key: 'friend_id'

  has_many :active_friends, -> { where(friendships: { approved: true }) },
           through: :friendships, source: :friend
  has_many :passive_friends, -> { where(friendships: { approved: true }) },
           through: :passive_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { approved: false }) },
           through: :friendships, source: :friend
  has_many :requested_friendships,
           -> { where(friendships: { approved: false }) },
           through: :passive_friendships, source: :user

  has_many :users_teams
  has_many :owned_teams, -> { where(users_teams: { is_owner: true }) },
           through: :users_teams, source: :team
  has_many :teams, through: :users_teams

  has_many :competitions, through: :teams



  def friends
    active_friends | passive_friends
  end

  def get_upcoming_fixtures
    teams.each do |t|

    end
  end

  def get_results
    teams.each do |t|

    end
  end



def self.search(search)
  where("name ILIKE ? OR email ILIKE ?", "%#{search}%","%#{search}%")
end


end
