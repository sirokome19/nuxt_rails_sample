class Questionnaire < ApplicationRecord
    has_many :choice_questions
    has_many :answer_sheets
end
