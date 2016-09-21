class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: 'User'
  belongs_to :voteable, polymorphic: true

  def self.vote_count(object)
    vote_count = 0
    object.votes.each do |vote|
      if vote.upvote?
        vote_count +=1
      else
        vote_count -=1
      end
    end
    vote_count
  end
end
