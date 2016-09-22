get '/users/:id' do
  if logged_in?
    if current_user_id == params[:id].to_i
      @user = logged_in_user
      erb :'user/show'
    else
      redirect "/users/#{current_user_id}"
    end
  else
    redirect '/'
  end
end

get '/users/:id/questions' do
  if logged_in?
    if current_user_id == params[:id].to_i
      @questions = User.find(params[:id]).questions
      erb :'questions/index'
    else
      redirect "/users/#{current_user_id}/questions"
    end
  else
    redirect '/'
  end
end

get '/users/:id/answers' do
  if logged_in?
    if current_user_id == params[:id].to_i
      @answers = User.find(params[:id]).answers
      erb :'answers/index'
    else
      redirect "/users/#{current_user_id}/answers"
    end
  else
    redirect '/'
  end

end

get '/users/:id/comments' do
  if logged_in?
    if current_user_id == params[:id].to_i
      @comments = User.find(params[:id]).comments
      erb :'comments/index'
    else
      redirect "/users/#{current_user_id}/comments"
    end
  else
    redirect '/'
  end

end
