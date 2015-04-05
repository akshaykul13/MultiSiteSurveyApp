class Question < ActiveRecord::Base
  attr_accessible :survey_id, :question, :response_values, :response_type
  enum response_type: [:multiple_choice, :yes_or_no, :open_ended]
end
