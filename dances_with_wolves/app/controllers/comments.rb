get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  erb :"/comments/_new_question_comment", layout: false, locals: { question: @question }
end

post '/questions/:id/comments' do
comment = Comment.new(text: params[:text], commenter_id: session[:user_id], commentable_id: params[:id], commentable_type: 'Question')
question = Question.find(params[:id])

  if comment.save
    redirect "/questions/#{question.id}"
  else
    @errors = comment.errors.full_messages
    erb :'/questions/show'
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
  @comment.destroy

  redirect "/questions/#{question.id}"
end
