# VOTE ON QUESTIONS
post '/questions/:id/votes/new/:vote_type' do
  if logged_in?
    vote_params_without_type = { voteable_id: params[:id], voteable_type: "Question", voter_id: logged_in_user.id }
    vote_params = vote_params_without_type.merge(vote_type_hash(params[:vote_type]))
    vote = Vote.find_by(vote_params_without_type)
    if vote.nil?
      Vote.create(vote_params)
    elsif Vote.find_by(vote_params).nil?
      vote.destroy
      Vote.create(vote_params)
    else
      vote.destroy
    end
    redirect "/questions/#{params[:id]}"
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#VOTE ON ANSWERS
post '/questions/:question_id/answers/:answer_id/votes/new/:vote_type' do
  if logged_in?
    vote_params_without_type = { voteable_id: params[:answer_id], voteable_type: "Answer", voter_id: logged_in_user.id}
    vote_params = vote_params_without_type.merge(vote_type_hash(params[:vote_type]))
    vote = Vote.find_by(vote_params_without_type)
    if vote.nil?
      Vote.create(vote_params)
    elsif Vote.find_by(vote_params).nil?
      vote.destroy
      Vote.create(vote_params)
    else
      vote.destroy
    end
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

# VOTE ON COMMENTS ON ANSWERS
post '/questions/:question_id/answers/:answer_id/comments/:comment_id/votes/new/:vote_type' do
  if logged_in?
    vote_params_without_type = { voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id}
    vote_params = vote_params_without_type.merge(vote_type_hash(params[:vote_type]))
    vote = Vote.find_by(vote_params_without_type)
    if vote.nil?
      Vote.create(vote_params)
    elsif Vote.find_by(vote_params).nil?
      vote.destroy
      Vote.create(vote_params)
    else
      vote.destroy
    end
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#VOTE ON COMMENTS ON QUESTIONS
post '/questions/:question_id/comments/:comment_id/votes/new/:vote_type' do
  if logged_in?
    vote_params_without_type = { voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id}
    vote_params = vote_params_without_type.merge(vote_type_hash(params[:vote_type]))
    vote = Vote.find_by(vote_params_without_type)
    p vote
    if vote.nil?
      Vote.create(vote_params)
    elsif Vote.find_by(vote_params).nil?
      vote.destroy
      Vote.create(vote_params)
    else
      vote.destroy
    end
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

private
# convert wildcard upvote/downvote param into upvote? attribute hash
def vote_type_hash(vote_type_string)
  if vote_type_string == "upvote"
    { upvote?: true }
  elsif vote_type_string == "downvote"
    { upvote?: false }
  end
end

