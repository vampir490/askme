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
      Question.new(text: 'How are you?', created_at: DateTime.parse('2019-04-03T04:04:02')),
      Question.new(text: 'Why not replying?', created_at: DateTime.parse('2019-06-14T15:13:30')),
      Question.new(text: 'So proud?', created_at: DateTime.parse('2019-07-23T14:10:00')),
      Question.new(text: 'Do you realize, that I know where you live?', created_at: DateTime.parse('2019-12-01T05:50:02'))
    ]

    @new_question = Question.new
  end
end
