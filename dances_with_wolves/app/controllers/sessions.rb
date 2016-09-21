#GET Register page
get '/users/new' do
  erb :'user/new'
end

#POST New user
post '/users' do
  @user = User.new(params[:user_registration])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      @registration_error = "You entered something incorrectly. Please try again!"
      erb :'user/new'
    end
end

#GET login page
get '/login' do
  erb :'user/login'
end

#LOGIN
post '/login' do
  @user = User.authenticate(params[:user_login])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    @login_error = "Email or password incorrect."
    erb :'user/login'
  end
end

# LOGOUT- Consider doing delete method
get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

