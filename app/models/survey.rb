class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions

  before_create :create_token do
    def create_token
      self.token = SecureRandom.urlsafe_base64(5, false)
    end
  end
end
