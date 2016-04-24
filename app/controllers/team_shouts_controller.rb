class TeamShoutsController < ApplicationController
   def create
    @shout = TeamShout.new(team_shout_params)


    respond_to do |format|
      if @shout.save
        @shout.user = current_user
        @shout.save!
        if @shout.team.team_shouts.count > 5
          TeamShout.where(team: @shout.team).first.destroy!
        end

        format.html { redirect_to @shout.team, notice: 'Notification added successfully' }
      else
        format.html { redirect_to @shout.team, alert: 'Notification error' }
      end
    end
  end
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def team_shout_params
    params.require(:team_shout).permit(:body, :team_id)
  end
end
