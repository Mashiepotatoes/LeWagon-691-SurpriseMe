class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    @answer.user_id = current_user.id
    @answer.save

    @response = ResponseSet.new
    @response.question_id = @question.id
    @response.user_id = current_user.id
    @response.answer_id = @answer.id
    @response.save

    # find a random question that the user has not answered
    @answered_questions = ResponseSet.where(user_id: current_user)
    @answered_questions_id = @answered_questions.map(&:question_id) # { |response| response.question_id }
    @all_questions = Question.all
    @possible_questions = @all_questions.reject do |question|
      @answered_questions_id.include? question.id
    end

    # If user has finished answering all questions, redirect to response_sets index
    if @possible_questions.empty? 
      redirect_to response_sets_path
    else
      @random_question = @possible_questions.sample
      redirect_to question_path(@random_question)
    end
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
