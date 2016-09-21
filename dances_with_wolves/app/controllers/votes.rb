
# VOTE ON QUESTIONS

#upvote
post '/questions/:id/votes/new/upvote' do
  if logged_in?
    vote_params = { voteable_id: params[:id], voteable_type: "Question", voter_id: logged_in_user.id, upvote?: true }
    vote = Vote.find_by(vote_params)
    if vote.nil?
      Vote.create(vote_params)
    else
      vote.destroy
    end
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#downvote
post '/questions/:id/votes/new/downvote' do
  if logged_in?
    vote_params = { voteable_id: params[:id], voteable_type: "Question", voter_id: logged_in_user.id, upvote?: false }
    vote = Vote.find_by(vote_params)
    if vote.nil?
      Vote.create(vote_params)
    else
      vote.destroy
    end
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#VOTE ON ANSWERS

#upvote
post '/questions/:question_id/answers/:answer_id/votes/new/upvote' do
  if logged_in?
    Vote.create(voteable_id: params[:answer_id], voteable_type: "Answer", voter_id: logged_in_user.id, upvote?: true)
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#downvote
post '/questions/:question_id/answers/:answer_id/votes/new/downvote' do
  if logged_in?

    Vote.create(voteable_id: params[:answer_id], voteable_type: "Answer", voter_id: logged_in_user.id, upvote?: false)
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#VOTE ON COMMENTS

#upvote
post '/questions/:question_id/answers/:answer_id/comments/:comment_id/votes/new/upvote' do
  if logged_in?
    Vote.create(voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id, upvote?: true)
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#downvote
post '/questions/:question_id/answers/:answer_id/votes/new/downvote' do
  if logged_in?
    Vote.create(voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id, upvote?: false)
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end


