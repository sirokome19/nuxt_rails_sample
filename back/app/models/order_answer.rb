class OrderAnswer < ApplicationRecord
    belongs_to :answer_sheet
    has_many :choice_answers
    has_many :free_answers
end
