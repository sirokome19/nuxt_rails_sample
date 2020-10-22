class ChoiceAnswer < Answer
  belongs_to :option, optional: false
end