module QuestionsHelper
  # Finding hashtag in the text of question
  def convert_hashtags_to_links(text)
    text.scan(Hashtag::REGEX).uniq.each do |tag|
      hashtag = Hashtag.find_by(name: tag.downcase)
      text.gsub!(tag, (link_to(tag, hashtag_path(hashtag), class: "hashtag-link")))
    end

    text.html_safe
  end
end
