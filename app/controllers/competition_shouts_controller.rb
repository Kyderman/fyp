class CompetitionShoutsController < ApplicationController
  def create
    @shout = CompetitionShout.new(competition_shout_params)


    respond_to do |format|
      if @shout.save
        @shout.user = current_user
        @shout.save!
        if @shout.competition.competition_shouts.count > 5
          CompetitionShout.where(competition: @shout.competition).first.destroy!
        end

        format.html { redirect_to @shout.competition, notice: 'Notification added successfully' }
      else
        format.html { redirect_to @shout.competition, alert: 'Notification error' }
      end
    end
  end
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def competition_shout_params
    params.require(:competition_shout).permit(:body, :competition_id)
  end
end
