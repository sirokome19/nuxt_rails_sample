require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  def setup
    @questionnaire = Questionnaire.create()
    @order_question = @questionnaire.order_questions.create()
    @choice_question = @order_question.choice_questions.create()
    @option = @choice_question.options.new()
  end

  test "should be valid" do
    assert @option.valid?
    assert @option.choice_question.valid?
  end
end
