
# VOTE ON QUESTIONS
post '/questions/:id/votes/new/:vote_type' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  @answers = @question.answers
  if logged_in?
    vote_params_without_type = { voteable_id: @question.id, voteable_type: "Question", voter_id: logged_in_user.id }
    vote = Vote.find_by(vote_params_without_type)
    vote_params = vote_params_without_type.merge(vote_type_hash(params[:vote_type]))
    create_or_destroy_vote(vote, vote_params)
    if request.xhr?
      content_type :json
      {votes: Vote.vote_count(@question), vote_id: Vote.find_by(voter_id: logged_in_user.id, voteable_id: @question.id)}.to_json
    else
      redirect "/questions/#{params[:id]}"
    end
  else
    @errors = ["Log in to vote."]
    erb :'/questions/show'
  end
end

#VOTE ON ANSWERS
post '/questions/:question_id/answers/:answer_id/votes/new/:vote_type' do
  @question = Question.find(params[:question_id])
  @comments = @question.comments
  @answers = @question.answers
  @answer = Answer.find(params[:answer_id])
  if logged_in?
    vote_params_without_type = { voteable_id: params[:answer_id], voteable_type: "Answer", voter_id: logged_in_user.id}
    vote = Vote.find_by(vote_params_without_type)
    vote_params = vote_params_without_type.merge(vote_type_hash(params[:vote_type]))
    create_or_destroy_vote(vote, vote_params)
    if request.xhr?
      content_type :json
      {votes: Vote.vote_count(@answer), vote_id: Vote.find_by(voter_id: logged_in_user.id, voteable_id: @answer.id)}.to_json
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    @errors = ["Log in to vote."]
    erb :'/questions/show'
  end
end

#VOTE ON COMMENTS ON QUESTIONS
post '/questions/:question_id/comments/:comment_id/votes/new/:vote_type' do
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:comment_id])
    @comments = @question.comments
    @answers = @question.answers
  if logged_in?
    vote_params_without_type = { voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id}
    vote = Vote.find_by(vote_params_without_type)
    vote_params = vote_params_without_type.merge(vote_type_hash(params[:vote_type]))
    create_or_destroy_vote(vote, vote_params)
    if request.xhr?
      content_type :json
      {votes: Vote.vote_count(@comment), vote_id: Vote.find_by(voter_id: logged_in_user.id, voteable_id: @comment.id)}.to_json
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    @errors = ["Log in to vote."]
    erb :'/questions/show'
  end
end

# VOTE ON COMMENTS ON ANSWERS
post '/questions/:question_id/answers/:answer_id/comments/:comment_id/votes/new/:vote_type' do
    @question = Question.find(params[:question_id])
    @comments = @question.comments
    @comment = Comment.find(params[:comment_id])
    @answers = @question.answers
  if logged_in?
    vote_params_without_type = { voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id}
    vote = Vote.find_by(vote_params_without_type)
    vote_params = vote_params_without_type.merge(vote_type_hash(params[:vote_type]))
    create_or_destroy_vote(vote, vote_params)
    if request.xhr?
      content_type :json
      {votes: Vote.vote_count(@comment), vote_id: Vote.find_by(voter_id: logged_in_user.id, voteable_id: @comment.id)}.to_json
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    @errors = ["Log in to vote."]
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

def create_or_destroy_vote(vote_object, vote_params)
  if vote_object.nil?
    Vote.create(vote_params)
  elsif Vote.find_by(vote_params).nil?
    vote_object.destroy
    Vote.create(vote_params)
  else
    vote_object.destroy
  end
end


