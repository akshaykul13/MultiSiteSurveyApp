class QuestionsController < ApplicationController
  @@survey_id  
  def index
    @questions = Question.all
  end  

  def show
    #@questions = Question.where("survey_id =" + params[:id])
    @@survey_id = params[:id]
    @questions = Question.where(survey_id: params[:id])
  end 

  def new
    # default: render ’new’ template
  end

  def create
    params[:question][:survey_id] = @@survey_id
    #params[:question][:response_type] = Question.response_types[params[:question][:response_type]]/
    @question = Question.create!(params[:question])
    flash[:notice] = "#{@question.question} was successfully created."
    redirect_to question_path(@@survey_id)
  end
end

