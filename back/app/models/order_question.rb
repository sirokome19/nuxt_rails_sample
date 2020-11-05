class OrderQuestion < ApplicationRecord
    belongs_to :questionnaire
    has_one :choice_question
    has_one :free_question
end
