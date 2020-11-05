class Answer < ApplicationRecord
  belongs_to :order_answer
  belongs_to :option, optional: true #親クラスではnull許容
  belongs_to :free_question, optional: true
end
