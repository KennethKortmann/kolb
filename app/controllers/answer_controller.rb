class AnswerController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @answers = getAnswers()
    activistPoints = 0
    theoristPoints = 0
    pragmatistPoints = 0
    reflectorPoints = 0
    activistPossibleAnswers = [1, 2];
    reflectorPossibleAnswers = [3, 4];
    theoristPossibleAnswers = [5, 6];
    pragmatistPossibleAnswers = [7, 8];

    for answer in @answers
      if activistPossibleAnswers.include? answer then
        activistPoints = activistPoints + 1
      elsif theoristPossibleAnswers.include? answer then
        theoristPoints = theoristPoints + 1
      elsif pragmatistPossibleAnswers.include? answer then
        pragmatistPoints = pragmatistPoints + 1
      elsif reflectorPossibleAnswers.include? answer then
        reflectorPoints = reflectorPoints + 1
      end
    end

    @activistStrength = getStrength(activistPoints, 3, 6, 10, 12, 20)
  end

  def getStrength (points, veryLowBoundary, lowBoundary, moderateBoundary, strongBoundary, veryStrongBoundary )
    if points <= veryLowBoundary
      return "Very low preference"
    elsif points <= lowBoundary
      return "Low preference"
    elsif points <= moderateBoundary
      return "Moderate preference"
    elsif points <= strongBoundary
      return "Strong preference"
    elsif points <= veryStrongBoundary
      return "Very strong prefences"
    end
  end

  def getStrengthLevel (activistPoints, reflectorPoints, theoristPoints, pragmatistPoints)
    veryLowPreference = [3, 8, 7, 8]
    lowPreference = [6, 11, 10, 11]
    moderatePreference = [10, 14, 13, 14]
    strongPreference = [12, 17, 15, 16]
    veryStrongPreference = [20, 20, 20, 20]
  end

  def getAnswers
    answers = []
    for i in 1..20
      if params["question_#{i}"] == "yes" then
        answers << i
      end
    end
    return answers
  end

end
