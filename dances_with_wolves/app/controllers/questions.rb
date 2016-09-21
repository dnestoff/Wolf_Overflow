get '/questions' do
  @questions = Question.all

  erb :"/questions/index"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers

  erb :"/questions/show"
end

post '/questions' do
  @question = Question.create(title: params[:title], text: params[:text])

  redirect "/questions"
end
