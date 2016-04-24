class FriendshipsController < ApplicationController
  def index
    @friends = current_user.passive_friends + current_user.active_friends

    @sent = current_user.pending_friends
    @received = current_user.requested_friendships
  end
  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id],
                                                 approved: 'false')
    if @friendship.save
      flash[:notice] = 'Friend requested.'
      redirect_to :back
    else
      flash[:error] = 'Unable to request friendship.'
      redirect_to :back
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    @friendship = Friendship.where(friend_id: current_user,
                                   user_id: params[:id]).first
    @friendship.update(approved: true)
    if @friendship.save
      redirect_to :back, notice: 'Successfully confirmed friend!'
    else
      redirect_to :back, notice: 'Sorry! Could not confirm friend!'
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.where(friend_id: [current_user, params[:id]])
                  .where(user_id: [current_user, params[:id]]).last
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to :back
  end

  private

  # Never trust parameters from the scary internet
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :approved)
  end
end
