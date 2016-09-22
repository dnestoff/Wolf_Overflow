class Question < ActiveRecord::Base
  belongs_to :poster,  class_name: 'User'
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :text, :title, presence: true

end
