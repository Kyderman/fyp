class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: :show

  def index
    @users = User.all
    authorize User
  end

  def show
    @is_home = false
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
      @is_home = true
    end

    @teams = @user.teams.includes(:sport)
    @competitions = @user.competitions.includes(:sport).includes(:teams).includes(:competition_format)

  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, notice: 'User updated.'
    else
      redirect_to users_path, alert: 'Unable to update user.'
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
