class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy, :register, :unregister, :start]

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @competition = @league.competition
    @standings = @league.get_table
    @results = @competition.results
    @fixtures = @competition.upcoming_fixtures
    @notification = CompetitionShout.new
    @notifications = @competition.competition_shouts.includes(:user).reverse

  end

  # GET /leagues/new
  def new
    @league = League.new
    @league.build_competition
    @competition = @league.competition
    @competition.teams_competitions.build
    @teams_competitions = @competition.teams_competitions
  end

  # GET /leagues/1/edit
  def edit
    @competition = @league.competition
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(league_params)
    respond_to do |format|
      if @league.save
        @league.competition.update(owner: current_user)
        #@league.create_league
        #@league.generate_fixtures
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'League was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register
    @team = Team.find(params[:team_id])
    @league.competition.teams_competitions.build(team: @team)
    @league.competition.save!
    if @league.competition.teams.count == @league.competition.maximum_teams
      @league.create_league
      @league.generate_fixtures
      @league.competition.is_underway = true
      @league.competition.save!
    end
    redirect_to :back, notice: 'You are registered for the league.'
  end

  def unregister
    @team = Team.find(params[:team_id])
    @league.competition.teams.delete(@team)
    redirect_to :back, notice: 'You are no longer registered for this league.'
  end

  def start
    @league.create_league
    @league.generate_fixtures
    @league.competition.is_underway = true
    @league.competition.save!
    redirect_to :back, notice: 'The league is now underway.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def league_params
      params.require(:league).permit(:win_points, competition_attributes: [:id, :name, :sport_id, :maximum_teams,
      :closing_date, :description, teams_competitions_attributes: [:id, :team_id, :competition_id, :_destroy]])
    end
end
