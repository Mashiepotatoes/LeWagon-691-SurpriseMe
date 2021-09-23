class SessionsController < ApplicationController
  def new
    @session = Session.new
    @session.user = current_user
    @session.recipient = User.first
    @session.save
  end

  def create
  end
end
