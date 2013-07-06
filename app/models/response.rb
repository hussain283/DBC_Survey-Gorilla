class Response < ActiveRecord::Base
  belongs_to :survey_attempt
  belongs_to :question
  has_one :answer
end
