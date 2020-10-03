class Answer < ApplicationRecord
  belongs_to :answer_sheet
  belongs_to :option, optional: true
end
