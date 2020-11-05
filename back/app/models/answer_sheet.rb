class AnswerSheet < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  has_many :order_answers

  validates :user_id, uniqueness: {scope: [:questionnaire_id]}
end
