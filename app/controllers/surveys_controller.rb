class SurveysController < ApplicationController
  def index
    @surveys = Survey.order(created_at: :desc)
  end

  def new
    # default: render ’new’ template
  end

  def create   
    #@survey = Survey.create!(params[:survey])
    @survey = Survey.new(params[:survey])
    if @survey.save 
     flash[:notice] = "#{@survey.survey_name} was successfully created."
     redirect_to surveys_path
    else
     flash[:notice] = "Error: #{@survey.errors.full_messages}"
     render 'new'
     #session[:survey] = params[:survey]
     #redirect_to :action => 'new' #new_survey_path(survey: params[:survey])
    end  
  end

  def search_surveys
    @surveys = Survey.where("survey_name like :search", search: "%"+params[:search][:survey_name]+"%")
    if @surveys.empty?
      flash[:notice] = "Error: No matching survey found!!"
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Survey ’#{@survey.survey_name}’ deleted."
    redirect_to surveys_path
  end
end

