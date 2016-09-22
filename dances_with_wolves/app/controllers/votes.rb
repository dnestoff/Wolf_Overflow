
# VOTE ON QUESTIONS

#upvote
post '/questions/:id/votes/new/:vote_type' do
  if logged_in?
    vote_params = { voteable_id: params[:id], voteable_type: "Question", voter_id: logged_in_user.id }
    vote = Vote.find_by(vote_params)
    if vote.nil?
      Vote.create(vote_params.merge({upvote?: params[:vote_type]}))
    elsif Vote.find_by(vote_params.merge({upvote?: params[:vote_type]})).nil?
      vote.destroy
      Vote.create(vote_params.merge({upvote?: params[:vote_type]}))
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

# #downvote
# post '/questions/:id/votes/new/downvote' do
#   if logged_in?
#     vote_params = { voteable_id: params[:id], voteable_type: "Question", voter_id: logged_in_user.id }
#     vote = Vote.find_by(vote_params)
#     if vote.nil?
#       Vote.create(vote_params.merge({upvote?: params[:vote_type]}))
#     elsif Vote.find_by(vote_params.merge({upvote?: params[:vote_type]})).nil?
#       vote.destroy
#       Vote.create(vote_params.merge({upvote?: params[:vote_type]}))
#     else
#       vote.destroy
#     end
#     redirect "/questions/#{params[:id]}"
#   else
#     @errors = "Log in to vote."
#     @question = Question.find(params[:id])
#     @answers = @question.answers
#     erb :'/questions/show'
#   end
# end

#VOTE ON ANSWERS

#upvote
post '/questions/:question_id/answers/:answer_id/votes/new/:vote_type' do
  if logged_in?
    vote_params = { voteable_id: params[:answer_id], voteable_type: "Answer", voter_id: logged_in_user.id}
    vote = Vote.find_by(vote_params)
    if vote.nil?
      Vote.create(vote_params.merge({upvote?: params[:vote_type]}))
    elsif Vote.find_by(vote_params.merge({upvote?: params[:vote_type]})).nil?
      vote.destroy
      Vote.create(vote_params.merge({upvote?: params[:vote_type]}))
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

#downvote
post '/questions/:question_id/answers/:answer_id/votes/new/downvote' do
  if logged_in?
    vote_params = { voteable_id: params[:answer_id], voteable_type: "Answer", voter_id: logged_in_user.id }
    vote = Vote.find_by(vote_params)
    if vote.nil?
      Vote.create(vote_params.merge({upvote?: false}))
    elsif Vote.find_by(vote_params.merge({upvote?: false})).nil?
      vote.destroy
      Vote.create(vote_params.merge({upvote?: false}))
    else
      vote.destroy
    end
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#VOTE ON COMMENTS ON ANSWERS

#upvote
post '/questions/:question_id/answers/:answer_id/comments/:comment_id/votes/new/upvote' do
  if logged_in?
    vote_params = { voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id}
    vote = Vote.find_by(vote_params)
    p "$$$$$$$$$$$$$$$$$$"
    p vote
    if vote.nil?
      p "@@@@@@@@@@@@@@@@@@@"
      Vote.create(vote_params.merge({upvote?: true}))
    elsif Vote.find_by(vote_params.merge({upvote?: true})).nil?
      vote.destroy
      Vote.create(vote_params.merge({upvote?: true}))
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

#downvote
post '/questions/:question_id/answers/:answer_id/comments/:comment_id/votes/new/downvote' do
  if logged_in?
    vote_params = { voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id }
    vote = Vote.find_by(vote_params)
    if vote.nil?
      Vote.create(vote_params.merge({upvote?: false}))
    elsif Vote.find_by(vote_params.merge({upvote?: false})).nil?
      vote.destroy
      Vote.create(vote_params.merge({upvote?: false}))
    else
      vote.destroy
    end
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

#VOTE ON COMMENTS ON QUESTIONS

#upvote
post '/questions/:question_id/comments/:comment_id/votes/new/upvote' do
  if logged_in?
    vote_params = { voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id}
    vote = Vote.find_by(vote_params)
    p vote
    if vote.nil?
      Vote.create(vote_params.merge({upvote?: true}))
    elsif Vote.find_by(vote_params.merge({upvote?: true})).nil?
      vote.destroy
      Vote.create(vote_params.merge({upvote?: true}))
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

#downvote
post '/questions/:question_id/comments/:comment_id/votes/new/downvote' do
  if logged_in?
    vote_params = { voteable_id: params[:comment_id], voteable_type: "Comment", voter_id: logged_in_user.id }
    vote = Vote.find_by(vote_params)
    p vote
    if vote.nil?
      Vote.create(vote_paramsmerge({upvote?: false}))
    elsif Vote.find_by(vote_params.merge({upvote?: false})).nil?
      vote.destroy
      Vote.create(vote_params.merge({upvote?: false}))
    else
      vote.destroy
    end
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = "Log in to vote."
    @question = Question.find(params[:id])
    @answers = @question.answers
    erb :'/questions/show'
  end
end

