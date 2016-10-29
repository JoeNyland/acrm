class SessionsController < ApplicationController

  def new
    # redirect_to root_path if logged_in?
  end

  def create

    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy

  end

end
