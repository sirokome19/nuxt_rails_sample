require 'test_helper'

class ChoiceQuestionTest < ActiveSupport::TestCase
  def setup
    @questionnaire = Questionnaire.new()
    @choice_question = @questionnaire.choice_questions.new()
  end

  test "should be valid" do
    assert @choice_question.valid?
    assert @choice_question.questionnaire.valid?
  end
end
