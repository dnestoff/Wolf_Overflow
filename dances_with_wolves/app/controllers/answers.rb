get '/questions/:id/answers/new' do
  erb :'/answers/new'
end

post '/questions/:id/answers' do
  @answer = Answer.new(text: params[:text], poster_id: session[:user_id], question: params[:question])
  if @answer.save
    redirect '/questions/:id'
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
