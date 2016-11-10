module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns whether or not a user is logged in
  def logged_in?
    !session[:user_id].nil?
  end

  # Log out a user
  def log_out
    session.delete(:user_id)
  end

  # Confirms a logged-in user and redirects to the login page if not logged in
  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_path and return false
    end
    true
  end


end
