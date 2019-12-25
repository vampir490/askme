class Hashtag < ApplicationRecord

  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  REGEX = /#[[:word:]]+/

  scope :with_questions, -> { where(id: HashtagQuestion.select(:hashtag_id)) }
end
