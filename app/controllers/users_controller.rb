class UsersController < ApplicationController

  before_action :load_user, except: [:index, :create, :new]
  before_action :authorize_user, except: [:index, :new, :create, :show]

  def index
    @users = User.all
  end


  def new
    # Not giving logged in user to sign up
    redirect_to root_url, alert: 'You are already logged in' if current_user.present?
    
    @user = User.new
  end

  def create
    redirect_to root_url, alert: 'You are already logged in' if current_user.present?
    
    @user = User.new(user_params)
    # Trying to create user
    if @user.save
      # If successfully, redirecting to user's page
      redirect_to root_url, notice: 'Signed up successfully!'
      session[:user_id] = @user.id
    else
      # If no, render a page to sign up
      render 'new'
    end
  end

  def edit
  end

  def update
    # Trying to update user
    if @user.update(user_params)
      # If successfully, redirecting to user's page
      redirect_to user_path(@user), notice: 'User updated'
    else
      # If no, redirecting to user's page
      render 'edit'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)

    @new_question = @user.questions.build

    @questions_count = @questions.count

    @answers_count = @questions.where.not(answer: nil).count

    @unanswered_count = @questions_count - @answers_count
  end

  def destroy
    @user.destroy
    redirect_to root_url, notice: 'We will miss you'
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  private

  def load_user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url, :background_color)
  end
end
