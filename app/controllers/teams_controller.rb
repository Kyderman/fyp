class TeamsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    if params[:search]
      @teams = Team.search(params[:search], params[:sport]).order("created_at DESC")
      @search = true
    else
      @teams = []
      @search = false
    end
    authorize Team
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    authorize @team
    @competitions = @team.competitions.includes(:competition_format)
    @notification = TeamShout.new
    @notifications = @team.team_shouts.includes(:user).reverse
    @members = @team.members
  end

  # GET /teams/new
  def new
    @team = Team.new
    authorize @team
  end

  # GET /teams/1/edit
  def edit
    authorize @team
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    authorize @team

    respond_to do |format|
      if @team.save
        current_user.owned_teams << @team
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    authorize @team
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    authorize @team
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :sport_id, users_teams_attributes: [:id, :user_id, :is_owner, :done, :_destroy])
    end
end
