class FreeAnswer < Answer
  belongs_to :free_question, optional: false
end