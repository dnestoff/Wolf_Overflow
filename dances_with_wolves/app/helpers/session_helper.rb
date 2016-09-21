helpers do
  def logged_in?
    session[:user_id] != nil
  end

  def logged_in_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
end
