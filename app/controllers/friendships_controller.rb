class FriendshipsController < ApplicationController
  before_action :authenticate
  before_action :authorize, only: [:index]

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
  end

  private
  def friend_accept_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end

  # def create
  #   @friendship = current_user.friendships.build(friend_id: params[:friend_id])
  #   if @friendship.save
  #     flash[:notice] = "Added friend".
  #     redirect_to flash[:last_url]
  #   else
  #     flash[:notice] = "Unable to add friend".
  #     redirect_to flash[:last_url]
  #   end
  # end
  #
  # def destroy
  #   @friendship = current_user.friendships.find(params[:id])
  #   @friendship.destroy
  #   flash[:notice] = "Removed friendship."
  #   redirect_to flash[:last_url]
  # end

end
