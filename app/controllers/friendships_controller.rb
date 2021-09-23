class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @friend_list = Friendship.where(user: current_user,status: true) # current_user friend list
    @requests = Friendship.where(user: current_user,status: false)
    @invitations =  Friendship.where(friend: current_user,status: false)

  end

  def show
  end

  def create
    friend_to_add = User.find(params[:friend])

    add_friend = Friendship.create(user: current_user,friend: friend_to_add)
    # inverse_friendship = Friendship.create(user: friend_to_add,friend: current_user)
  end

  def accept
    @invitation = Friendship.find(params[:invitation])
    @invitation.status = true
    @invitation.save
    Friendship.create!(user: current_user, friend: @invitation.user, status: true)
  end

end
