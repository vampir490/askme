class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  # On update and create we scan the question and update the list of hashtags
  after_commit :update_hashtags, on: [:create, :update]

  private

  def update_hashtags
    self.hashtags =
      "#{text} #{answer}".downcase.scan(Hashtag::REGEX).uniq.map do |tag|
        Hashtag.find_or_create_by(name: tag)
      end
  end
end
