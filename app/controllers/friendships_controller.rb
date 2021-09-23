class FriendshipsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def destroy
  end
end
