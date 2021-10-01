class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def landing
    if !params[:id].nil?
      @question = Question.find(params[:id])
    else
      @question = @ #find a sample id
    end
  end
end
