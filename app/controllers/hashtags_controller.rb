class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(id: params[:id])

    @hashtagged_questions = Question.includes(:hashtags).where(hashtags: {id: @hashtag.id})
  end
end
