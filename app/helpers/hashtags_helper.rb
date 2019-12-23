module HashtagsHelper
  def hashtags_with_questions
    Hashtag.where(id: HashtagQuestion.select(:hashtag_id))
  end
end