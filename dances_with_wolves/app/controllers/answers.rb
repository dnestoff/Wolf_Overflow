get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  if request.xhr?
    erb :'/answers/_new_form', layout: false, locals: { question: @question }
  else
    erb :'/answers/new'
  end
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(text: params[:text], poster_id: session[:user_id], question_id: params[:id])
  @favorited_answer = @question.answers.find_by(best_answer: true)

  if @answer.save
    if request.xhr?
      erb :"/answers/_new_answer", layout: false, locals: {question: @question, answer: @answer, favorited_answer: @favorited_answer}
    else
      redirect "/questions/#{@question.id}"
    end
  else
      @errors = @answer.errors.full_messages
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
