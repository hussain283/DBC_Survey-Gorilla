class Response < ActiveRecord::Base
  belongs_to :survey_attempt
  has_one :question
  has_one :answer
end
