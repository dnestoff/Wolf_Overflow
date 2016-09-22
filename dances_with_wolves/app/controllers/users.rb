get '/users/:id' do
  if logged_in?
    p "LOGGGGGGGGGGED IN"
    p current_user_id
    p params[:id]
    if current_user_id == params[:id].to_i
      " USER MATCHES"
      @user = logged_in_user
      erb :'user/show'
    else
      p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      redirect "/users/#{params[:id]}"
    end
  else
    redirect '/'
  end
end
