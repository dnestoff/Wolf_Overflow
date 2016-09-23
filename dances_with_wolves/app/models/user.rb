class User < ActiveRecord::Base
  has_many :questions,  foreign_key: :poster_id
  has_many :answers,  foreign_key: :poster_id
  has_many :comments,  foreign_key: :commenter_id
  has_many :votes,  foreign_key: :voter_id
  validates :email, :username, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password= new_password
    @raw_password = new_password
    if @raw_password.length > 6
      @password = BCrypt::Password.create(@raw_password)
      self.password_hash = @password
    else
      @errors = ["Your password must be at least 6 characters."]
    end
  end

  def self.authenticate (email, password)
    user_to_authenticate = User.find_by(email: email)
    if user_to_authenticate
      return user_to_authenticate if user_to_authenticate.password == password
    end
    nil
  end

  def best_answers
    if self.answers.find_by(best_answer: true)
      self.answers.where(best_answer: true)
    else
      nil
    end
  end
end
