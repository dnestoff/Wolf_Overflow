get '/questions' do
  @questions = Question.all

  erb :"/questions/index"
end

post '/questions' do
  @question = Question.new(title: params[:title], text: params[:text])

  if @question.save
    redirect '/questions'
  else
    @errors = ["input cannot be empty"]
    redirect "/questions/#{@question.id}"
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers

  erb :"/questions/show"
end
