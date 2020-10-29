class Questionnaire < ApplicationRecord
    has_many :order_questions
    has_many :answer_sheets
end
