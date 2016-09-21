class User < ActiveRecord::Base
  has_many :questions,  foreign_key: :poster_id
  has_many :answers,  foreign_key: :poster_id
  has_many :comments,  foreign_key: :commenter_id
  has_many :votes,  foreign_key: :voter_id

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password= new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate (email, password)
    user_to_authenticate = User.find_by(email: email)
    if user_to_authenticate
      return user_to_authenticate if user_to_authenticate.password == password
    end
    nil
  end

end
