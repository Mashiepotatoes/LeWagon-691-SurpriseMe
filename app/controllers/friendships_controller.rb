class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  def index
    @friend_list = Friendship.where(user: current_user,status: true) # current_user friend list
  end

  def requests
    @requests = Friendship.where(user: current_user,status: false)
    @invitations =  Friendship.where(friend: current_user,status: false)

  end

  def show
    @friend = User.find(params[:id])
    @friend_list = Friendship.where(user: current_user, friend_id: @friend)
    @gift_session = GiftSession.new
  end

  def create
    friend_to_add = User.find(params["format"])
    @add_friend = Friendship.create(user: current_user,friend: friend_to_add)
    redirect_to friendships_path
  end

  def accept
    @invitation = Friendship.find(params[:format])
    @invitation.status = true
    @invitation.save

    @new_friend = Friendship.create!(user: current_user, friend: @invitation.user, status: true)
    redirect_to friendships_path
  end

  def search
    @friendship = Friendship.all
    if params[:query].present?
      @users = User.search_by_username(params[:query])
    else
      redirect_to friendships_path
    end
  end

  def cancel
    @request = Friendship.find(params[:id])
    @request.destroy
    redirect_to friendships_requests_path
  end

  def destroy

    @friendship = Friendship.find(params[:id]) #user: current_user
    @another_friendship = Friendship.find_by user: @friendship.friend,friend:current_user
    @another_friendship.destroy
    @friendship.destroy
    redirect_to friendships_path

  end
end
