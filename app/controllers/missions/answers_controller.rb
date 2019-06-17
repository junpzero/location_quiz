module Missions
  class AnswersController < ApplicationController
    before_action :set_location, only: %i(show)
    before_action :set_question, only: %i(show)
    def show
    end

    def create

    end

    private

    def set_location
      @location = Location.find(params[:mission_id])
    end

    def set_question
      @question = @location.question
    end
  end
end