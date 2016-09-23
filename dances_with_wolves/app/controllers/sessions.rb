#GET Register page
get '/users/new' do
  if request.xhr?
    erb :'partials/_register', layout: false
  else
    erb :'user/new'
  end
end

#POST New user
post '/users' do
  @user = User.new(params[:user_registration])
    if @user.save
      session[:user_id] = @user.id
      if request.xhr?
        @errors = @user.errors.full_messages
        erb :'/partials/_login_toolbar', layout: false
      else
        redirect '/'
      end
    else
      @errors = ["You entered something incorrectly. Please try again!"]
      erb :'user/new'
    end
end

#GET login page
get '/login' do
  if request.xhr?
    erb :'/partials/_login', layout: false
  else
    erb :'user/login'
  end
end

#LOGIN
post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    if request.xhr?
      @errors = @user.errors.full_messages
      erb :'/partials/_login_toolbar', layout: false
    else
      redirect '/'
    end
  else
    @errors = ["Email or password incorrect."]
    erb :'user/login'
  end
end

# LOGOUT- Consider doing delete method
get '/logout' do
  session[:user_id] = nil
  if request.xhr?
    erb :'/partials/_login_toolbar', layout: false
  else
    redirect '/'
  end
end

