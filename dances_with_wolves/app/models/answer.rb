class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :poster, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :text, presence: true
  validate :answer_length

  def answer_length
    if text.length < 1
      errors.add(:text, "Can not be blank")
    end
  end

end
