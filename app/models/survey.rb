class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :survey_attempts

  accepts_nested_attributes_for :questions

  before_create :create_token do
    def create_token
      self.token = SecureRandom.urlsafe_base64(5, false)
    end
  end
end
