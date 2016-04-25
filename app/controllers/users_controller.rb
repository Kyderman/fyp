class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:show, :index]

  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
      @search = true
    else
      @users = []
      @search = false
    end
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
    @owned_competitions = Competition.where(owner: current_user)

    @competitions += @owned_competitions
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
