get '/questions' do
  @questions = Question.all

  erb :"/questions/index"
end



post '/questions' do
  question = Question.new(title: params[:title], text: params[:text])
  @questions = Question.all

  if question.save
    redirect '/questions'
  else
    @errors = question.errors.full_messages
    erb :"/questions/index"
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @comments = @question.comments
  
  erb :"/questions/show"
end
