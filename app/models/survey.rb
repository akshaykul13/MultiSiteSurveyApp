class Survey < ActiveRecord::Base
  attr_accessible :survey_name, :surveyor_name, :description, :survey_creation_date 
  validates :survey_name, :presence => true
  validates :surveyor_name, :presence => true
  validates :description, :presence => true
end
