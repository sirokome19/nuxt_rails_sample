class Questionnaire < ApplicationRecord
    has_many :choices
    has_many :answer_sheets
end
