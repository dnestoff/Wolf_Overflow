helpers do
  def logged_in?
    session[:user_id] != nil
  end

  def logged_in_user
    if session[:user_id]
      @cached_user = User.find(session[:user_id])
    end

  end

  def current_user_id
    if logged_in_user
      logged_in_user.id
    else
      nil
    end
  end
end
