class ResponseSetsController < ApplicationController
  def index
    @response_sets = ResponseSet.where(user: current_user)
    @question = Question.first
  end

  # To be updated if edit function is needed
  def edit
    @response_sets = ResponseSet.where(user: current_user)
  end
end
