class Option < ApplicationRecord
  belongs_to :choice_question
  has_many :choice_answers
end
