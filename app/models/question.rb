class Question < ActiveRecord::Base

  has_many :responses
  validates :title, :presence => true;
  validates :content, :presence => true;

end
