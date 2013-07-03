class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true

  after_create :check_url

  def check_url
    self.url = "/posts/#{self.id}/show" if self.url.blank?
    self.save
  end
end
