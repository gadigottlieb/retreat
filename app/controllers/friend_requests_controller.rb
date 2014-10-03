class FriendRequestsController < ApplicationController

  before_action :authenticate
  # before_action :authorize, only[:index]

  def index
    @friend_requests = current_user.friend_requests
  end

  def create
    @friend_request = FriendRequest.create(friend_request_params)
  end

  def accept
    @friend_request = FriendRequest.find(params[:friend_request_id])
    Friendship.create(user: @friend_request.user, friend: @friend_request.sender)
    @friend_request.destroy
  end

  def reject
    @friend_request = FriendRequest.find(params[:friend_request_id])
    @old_friend_id = @friend_request.sender.id
    @friend_request.destroy
  end

  private
  def friend_request_params
    params.require(:friend_request).permit(:user_id, :sender_id)
  end

end
