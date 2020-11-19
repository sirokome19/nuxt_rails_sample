require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  def setup
    @questionnaire = Questionnaire.create()
    @order_question = @questionnaire.order_questions.create(order_num:0)
    @choice_question = @order_question.create_choice_question()
    @option = @choice_question.options.new()
  end

  test "should be valid" do
    assert @option.valid?
    assert @option.choice_question.valid?
  end
end
