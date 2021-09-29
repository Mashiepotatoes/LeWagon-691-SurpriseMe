class ResponseSetsController < ApplicationController
  def index
    @response_sets = ResponseSet.where(user_id: current_user)
  end
end
