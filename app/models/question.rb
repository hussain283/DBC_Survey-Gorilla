class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :response
  has_many :answers

  accepts_nested_attributes_for :answers
end
