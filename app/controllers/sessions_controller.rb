class SessionsController < ApplicationController
  def new
    @session = Session.new
    @session.user = current_user
    @session.recipient = User.last
    if @session.save
      # redirect_to friendship_gift_recommendations_path(friendship)
    end
  end

  def create
  end
end
