class BirthdaysController < ApplicationController
  def index
    @friend_list = Friendship.where(user: current_user,status: true)
    @question = Question.first
    @response_sets = ResponseSet.where(user: current_user)
  end
end
