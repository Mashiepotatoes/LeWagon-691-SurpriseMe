class ResponseSetsController < ApplicationController
  def index
    # List all question
    @question = Question.all

    # List all answers by current user
    # @response = ResponseSet.new
    # @response.question_id = @question.id
    # @response.user_id = current_user.id
    # @response.answer_id = @answer.id
  end
end
