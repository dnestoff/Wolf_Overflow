class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :poster, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
