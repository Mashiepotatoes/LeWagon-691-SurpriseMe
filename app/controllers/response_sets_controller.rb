class ResponseSetsController < ApplicationController
  def index
    @response_sets = ResponseSet.where(user: current_user)
    @question = Question.first
    @all_questions = Question.all
    @response_sets.nil? || (@response_sets.count != @all_questions.count) ? @quiz_landing = true : @quiz_landing = false
  end

  # To be updated if edit function is needed
  def edit
    @response_sets = ResponseSet.where(user: current_user)
  end
end
