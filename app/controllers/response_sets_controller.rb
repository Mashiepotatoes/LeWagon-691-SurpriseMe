class ResponseSetsController < ApplicationController
  def index
    # List all question
    @response_sets = ResponseSet.where(user_id: current_user)
    # List all answers by current user
    # How do i retrieve current user response for a particular qn?

  end
end
