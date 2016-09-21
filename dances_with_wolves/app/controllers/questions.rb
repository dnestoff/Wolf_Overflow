get '/questions' do
  @questions = Question.all

  erb :"/questions/index"
end

post '/questions' do
  question = Question.new(title: params[:title], text: params[:text])

  if question.save
    redirect '/questions'
  else
    @errors = ["input cannot be empty"]
    erb :"/questions/index", layout: false, locals: {errors: @errors}
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers

  erb :"/questions/show"
end
