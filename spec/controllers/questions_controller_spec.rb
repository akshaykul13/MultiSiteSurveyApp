require 'spec_helper'


describe QuestionsController, type: :controller do 
  before :each do
    get :new
  end
  it 'should display new template for rendering' do 
     response.should render_template('new')   
  end
end

describe QuestionsController, type: :controller do 
 #fixtures :questions 
 before :each do
    #@question1 = FactoryGirl.build(:survey_id => 1, :question => "First question")
    #@question2 = FactoryGirl.build(:survey_id => 2, :question => "Second Question")
    #@fake_questions = [@question1, @question2]
    get :show, {:id => '1'}
  end
  it 'should display show template for rendering' do 
     response.should render_template('show')   
  end
end

describe QuestionsController, type: :controller do 
  before :each do
    post :create, {:question => {:survey_id => '1'}}
  end 
  it 'should redirect to show template for rendering' do 
     response.should redirect_to( question_path(1))   
  end
end

