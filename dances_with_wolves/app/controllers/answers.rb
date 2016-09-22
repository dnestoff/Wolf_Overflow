get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'/answers/new'
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(text: params[:text], poster_id: session[:user_id], question_id: params[:id])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors
    erb :'answers/new'
  end
end

get '/questions/:id/answers/:answer_id/edit' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  erb :'answers/edit'
end

put '/questions/:id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.update_attributes(text: params[:text])
  redirect "/questions/#{@answer.question_id}"
end

delete '/questions/:id/answers/:answer_id' do
  @question = Question.find(params[:id])
  Answer.find(params[:answer_id]).destroy
  redirect "/questions/#{@question.id}"
end

put '/questions/:id/answers/:answer_id/favorite' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  Answer.find(params[:answer_id]).update_attributes(best_answer: true)
  redirect "/questions/#{@question.id}"
end

put '/questions/:id/answers/:answer_id/unfavorite' do
  @question = Question.find(params[:id])
  Answer.find(params[:answer_id]).update_attributes(best_answer: false)
  redirect "/questions/#{@question.id}"
end
