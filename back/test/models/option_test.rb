require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  def setup
    @questionnaire = Questionnaire.new()
    @choice_question = @questionnaire.choice_questions.new()
    @option = @choice_question.options.new()
  end

  test "should be valid" do
    assert @option.valid?
    assert @option.choice_question.valid?
    assert @option.choice_question.questionnaire.valid?
  end
end
