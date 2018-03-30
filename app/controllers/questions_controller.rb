class QuestionsController < ApplicationController
  def index
  end

  def create
    questionnaire_params = params.require(:id)
    @preferences = Preference.new(questionnaire_params)
  end

  #create
  #update
  #show
end
