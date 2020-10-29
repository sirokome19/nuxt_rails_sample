class OrderQuestion < ApplicationRecord
    belongs_to :questionnaire
    has_many :choice_questions
    has_many :free_questions
end
