get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])

  if request.xhr?
    erb :"/comments/_new_question_comment", layout: false, locals: { question: @question }
  else
    erb :"/comments/_new_question_comment"
  end
end

post '/questions/:id/comments' do
comment = Comment.new(text: params[:text], commenter_id: session[:user_id], commentable_id: params[:id], commentable_type: 'Question')
question = Question.find(params[:id])

  if request.xhr?
    if comment.save
      erb :"/comments/_new_comment", layout: false, locals: {question: question, comment: comment}
    else
      erb :"/questions/show"
    end
  else
    if comment.save
      redirect "/questions/#{question.id}"
    else
      @errors = comment.errors.full_messages
      erb :'/questions/show'
    end
  end
end

get '/questions/:id/comments/:comment_id/edit' do
  @question = Question.find(params[:id])
  @comment = Comment.find(params[:comment_id])

  erb :"/comments/edit_question_comment"
end

put '/questions/:question_id/comments/:id' do
  question = Question.find(params[:question_id])
  @comment = Comment.find(params[:id])
  @comment.update_attributes(text: params[:text])

  redirect "/questions/#{question.id}"
end

delete '/questions/:question_id/comments/:id' do
  question = Question.find(params[:question_id])
  @comment = Comment.find(params[:id])
  if request.xhr?
    if @comment.destroy
      {status: 200, comment_id: @comment.id}.to_json
    else
      status 422
    end
  else
    @comment.destroy
    redirect "/questions/#{question.id}"
  end
end
