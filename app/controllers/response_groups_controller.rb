class ResponseGroupsController < ApplicationController
  @@questions_counter = 0
  @@questions_order = []
  @@response_group
  @@responses = {}

  def new
    @@questions_counter = 0
    @survey = Survey.find(params[:survey_id])
    questions_order = @survey.questions_order
    questions_order.split(/,+/).each do |order|
      @@questions_order << order
    end
    @questions = Question.where(survey_id: params[:survey_id])
    @current_question = Question.find(@@questions_order[@@questions_counter])
    redirect_to survey_response_group_path(params[:survey_id], @current_question)
  end

  def show
    @survey = Survey.find(params[:survey_id])   
    @questions = Question.where(survey_id: params[:survey_id])
    @current_question = Question.find(@@questions_order[@@questions_counter])
  end

  def next_question
    params[:response].each do |key, value|
      @@responses[key] = value
    end
    @@questions_counter = @@questions_counter + 1
    if @@questions_counter < @@questions_order.length
      Rails.logger.debug("Responses: #{@@responses.inspect}")
      Rails.logger.debug("Next question id: #{@@questions_order[@@questions_counter].inspect}")
      @current_question = Question.find(@@questions_order[@@questions_counter])
      redirect_to survey_response_group_path(params[:survey_id], @current_question)
    else
       @response_group = ResponseGroup.create!(:survey_id => params[:survey_id])
      @@responses.each do |key, value|
        @response = Response.create!(:response_group => @response_group.id, :question_id => key, :answer_text => value)      
      end
      redirect_to surveys_path(params[:survey_id])
    end
  end

  def prev_question
    @@questions_counter = @@questions_counter - 1
    @current_question = Question.find(questions_order[@@questions_counter])
    redirect_to survey_response_group_path(params[:survey_id], @current_question)
  end

  def create
    @response_group = ResponseGroup.create!(:survey_id => params[:survey_id])
    @@responses.each do |key, value|
      @response = Response.create!(:response_group => @response_group.id, :question_id => key, :answer_text => value)      
    end
    redirect_to surveys_path(params[:survey_id])
  end
end
