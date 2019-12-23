class Hashtag < ApplicationRecord

  has_many :hashtags_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  REGEX = /#[[:word:]]+/
end
