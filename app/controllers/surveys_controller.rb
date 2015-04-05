class SurveysController < ApplicationController
  def index
    @surveys = Survey.order(created_at: :desc)
  end

  def new
    # default: render ’new’ template
  end

  def create
    @survey = Survey.create!(params[:survey])
    flash[:notice] = "#{@survey.survey_name} was successfully created."
    redirect_to surveys_path
  end
end

