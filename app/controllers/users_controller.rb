class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Victor',
        username: 'vampir490',
        avatar_url: 'http://burundukmedia.com/wp-content/uploads/2016/10/775392.jpg'
      ),
      User.new(
        id: 2,
        name: 'Misha',
        username: 'mihalych')
    ]
  end


  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Victor',
      username: 'vampir490',
      avatar_url: 'http://burundukmedia.com/wp-content/uploads/2016/10/775392.jpg'
    )

    @questions = [
      Question.new(text: 'How are you?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'Why not replying?', created_at: Date.parse('27.04.2019'))
    ]

    @new_question = Question.new
  end
end
