class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: 'User'
  belongs_to :commentable, polymorphic: true

  validates :text, presence: true
end
