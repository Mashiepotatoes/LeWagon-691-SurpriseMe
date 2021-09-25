class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question
    @answer.save
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @response_sets = Response_set.find(params[:question_id])
    @response_sets.update(answer_params)
  end

  private

  def answer_params
    params.require(:answer).permit(:choice)
  end
end
