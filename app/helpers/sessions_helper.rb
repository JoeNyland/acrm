module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns whether or not a user is logged in
  def logged_in?
    !session[:user_id].nil?
  end

end
