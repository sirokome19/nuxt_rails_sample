class Option < ApplicationRecord
  belongs_to :choice, foreign_key: :question_id
end
