class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friend_list = Friendship.where(user: current_user, status: true) # current_user friend list
    @question = Question.first
    @response_sets = ResponseSet.where(user: current_user)
  end

  def requests
    @requests = Friendship.where(user: current_user,status: false)
    @invitations =  Friendship.where(friend: current_user,status: false)
    @question = Question.first
    @response_sets = ResponseSet.where(user: current_user)
  end

  def show
    @friend = User.find(params[:id])
    @friend_list = Friendship.where(user: current_user, friend_id: @friend)
    @gift_session = GiftSession.new
    @occasions = Occasion.all
  end

  def create
    friend_to_add = User.find(params["format"])
    @add_friend = Friendship.create(user: current_user,friend: friend_to_add)
    redirect_to friendships_path, notice: "Friend request sent!"
  end

  def accept
    @invitation = Friendship.find(params[:format])
    @invitation.status = true
    @invitation.save

    @new_friend = Friendship.create!(user: current_user, friend: @invitation.user, status: true)
    redirect_to friendships_path, notice: "Friend request accepted!"
  end

  def search
    @friendship = Friendship.all
    if params[:query].present?
      @users = User.search_by_username(params[:query])
    else
      redirect_to friendships_path
    end
    @question = Question.first
    @response_sets = ResponseSet.where(user: current_user)
  end

  def cancel
    @request = Friendship.find(params[:id])
    @request.destroy
    redirect_to friendships_requests_path
  end

  def destroy
    @friendship = Friendship.find(params[:id]) #user: current_user
    @another_friendship = Friendship.find_by user: @friendship.friend, friend: current_user
    @another_friendship.destroy
    @friendship.destroy
    redirect_to friendships_path
  end

  def sent
    @user = params[:user]

    @gift_session = GiftSession.where(user: @user).last
    if @gift_session == nil
      redirect_to friendships_path, notice: "Choose a friend first!"
    else
      @recipient = @gift_session.recipient
      mail = UserMailer.with(user: @user, gift_session: @gift_session, recipient: @recipient).send_sent_gift_email
      mail.deliver_now
      redirect_to friendships_path, notice: "Email has been sent to your friend"
    end
  end
end
