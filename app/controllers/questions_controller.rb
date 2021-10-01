class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def landing
    if params[:id].nil?
      answered_questions_id = ResponseSet.where(user: current_user).distinct.pluck(:question_id)
      @question = Question.where.not(id: answered_questions_id).sample
      if @question.nil?
        flash[:alert] = "You have answered all the questions already!"
        redirect_to response_sets_path
      else
        @question
      end
    else
      @question = Question.find(params[:id])
    end
  end
end
