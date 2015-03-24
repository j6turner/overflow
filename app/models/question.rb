class Question < ActiveRecord::Base

  has_many :responses
  belongs_to :user
  belongs_to :best_response, class_name: 'Response'
  validates :title, :presence => true
  validates :content, :presence => true

end
