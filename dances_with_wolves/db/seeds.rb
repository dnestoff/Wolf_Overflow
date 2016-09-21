User.destroy_all
Question.destroy_all
Answer.destroy_all
Comment.destroy_all
Vote.destroy_all

20.times do
  User.create(username: Faker::Hipster.word, email: Faker::Internet.email, password_hash: BCrypt::Password.create(Faker::Hipster.word))
end

50.times do
  Question.create(title: Faker::Hipster.sentence, text: Faker::Hipster.paragraphs(4), poster_id: rand(1..20))
end

200.times do
  Answer.create(text: Faker::Hipster.paragraph(rand(1..3)), question_id: rand(1..50), poster_id: rand(1..20))
end

500.times do
  Comment.create(text: Faker::Hipster.sentence, commentable_id: rand(1..50), commentable_type: "question", commenter_id: rand(1..20))
end

500.times do
  Comment.create(text: Faker::Hipster.sentence, commentable_id: rand(1..200), commentable_type: "answer", commenter_id: rand(1..20))
end

hash = { "answer" => 200, "question" => 50, "comment" => 1000 }

hash.each do |type, number|
  500.times do
    Vote.create(voteable_id: rand(1..number), voteable_type: type, voter_id: rand(1..20), upvote?: rand(0..1))
  end
end
