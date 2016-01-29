class TeamPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @team = model
  end

  def index?

  end

  def show?

  end

  def new?

  end

  def create?

  end

  def update?

  end

  def destroy?

  end
end
