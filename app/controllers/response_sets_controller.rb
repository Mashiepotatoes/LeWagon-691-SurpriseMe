class ResponseSetsController < ApplicationController
  def index
    @response_sets = Response_set.all
  end
end
