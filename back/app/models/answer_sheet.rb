class AnswerSheet < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  has_many :choice_answers

  validates :user_id, uniqueness: {scope: [:questionnaire_id]}
end
