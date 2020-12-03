class OrderAnswer < ApplicationRecord
    belongs_to :answer_sheet
    has_one :choice_answer
    has_one :free_answer
end
