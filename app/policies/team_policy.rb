class TeamPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @team = model
  end

  def index?
    !@current_user.nil?
  end

  def show?
    !@current_user.nil?
  end

  def new?
    @current_user.user?
  end

  def create?
    @current_user.user?
  end

  def edit?
    @current_user.owned_teams.include? @team
  end

  def update?
    @current_user.owned_teams.include? @team
  end

  def destroy?
    @current_user.owned_teams.include? @team
  end
end
