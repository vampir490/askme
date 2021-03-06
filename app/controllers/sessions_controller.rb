class SessionsController < ApplicationController
  def new
  end

  def create
    # First - authenticate user
    user = User.authenticate(params[:email], params[:password])

    # If found - redirect to root
    if user.present?
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Log-in successful'
    else
      # If no - an error and redirection to sign up
      flash.now.alert = 'Wrong email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out successfully!'
  end
end
