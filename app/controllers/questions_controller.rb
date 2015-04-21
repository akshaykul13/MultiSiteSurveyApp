class QuestionsController < ApplicationController

  def index
    @questions = Question.where(:survey_id => params[:survey_id])
  end  

  def new
    # default: render ’new’ template
  end

  def create
    params[:question][:survey_id] = params[:survey_id]
    #params[:question][:response_type] = Question.response_types[params[:question][:response_type]]/
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "#{@question.question} was successfully created."
      redirect_to survey_questions_path
    else
      flash[:notice] = "Error: #{@question.errors.full_messages}"
      render 'new'
    end

  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question ’#{@question.question}’ deleted."
    redirect_to question_path(@question.survey_id)
  end
end

