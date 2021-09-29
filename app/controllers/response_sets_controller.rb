class ResponseSetsController < ApplicationController
  def index
    @response_sets = ResponseSet.where(user: current_user)
    @question = Question.first
  end
end
