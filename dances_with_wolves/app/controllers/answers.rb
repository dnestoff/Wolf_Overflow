get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'/answers/new'
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  p @question
  @answer = Answer.new(text: params[:text], poster_id: session[:user_id], question_id: params[:id])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors
    erb :'answers/new'
  end
end

get '/questions/:id/answers/:id/edit' do

end

put '/questions/:id/answers/:id' do

end

delete '/question/:id/answers/:id' do

end
