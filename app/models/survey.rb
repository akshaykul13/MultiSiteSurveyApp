class Survey < ActiveRecord::Base
  attr_accessible :survey_name, :surveyor_name, :description, :survey_creation_date
end
