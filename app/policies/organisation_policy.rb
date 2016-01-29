class OrganisationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @org = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? || (@current_user.organiser? &&
                            @current_user.organisation == @org)
  end

  def new?
    @current_user.organiser? && @current_user.organisation.nil?
  end

  def create?
    @current_user.organiser? && @current_user.organisation.nil?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end
end
