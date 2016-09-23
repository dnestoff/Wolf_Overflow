get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  @question = Question.find(@answer.question_id)
  @favorited_answer = @question.answers.find_by(best_answer: true)

  if request.xhr?
    erb :"/comments/_new_answer_comment_form", layout: false, locals: { answer: @answer, question: @question, favorited_answer: @favorited_answer}
  else
    redirect "/questions/#{@answer.question_id}"
  end
end

post '/answers/:id/comments' do
  comment = Comment.new(text: params[:text], commenter_id: session[:user_id], commentable_id: params[:id], commentable_type: 'Answer')
  answer = Answer.find(params[:id])

  if comment.save
    # if request.xhr?
    #   erb :"/comments/_new_comment_for_answer", layout: false, locals: { answer: answer, comment: comment}
    # end

    redirect "/questions/#{answer.question_id}"

  else
    redirect "/questions/#{answer.question_id}"
  end
end

# for some reasaon this path isn't working.
get '/answers/:id/comments/:comment_id/edit' do
  @answer = Answer.find(params[:id])
  @comment = Comment.find(params[:comment_id])

  erb :"/comments/edit_answer_comment"
end

put '/answers/:id/comments/:comment_id' do
  comment = Comment.find(params[:comment_id])
  comment.update_attributes(text: params[:text])
  answer = Answer.find(params[:id])

  redirect "/questions/#{answer.question_id}"
end

delete '/answers/:id/comments/:comment_id' do
  comment = Comment.find(params[:comment_id])
  comment.destroy
  answer = Answer.find(params[:id])

  redirect "/questions/#{answer.question_id}"
end
