require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @questionnaire = Questionnaire.create()
    @order_question = @questionnaire.order_questions.create(order_num:0)
    @choice_question = @order_question.choice_questions.new()
    @free_question = @order_question.free_questions.new()

  end

  test "should be valid choice_question" do
    assert @choice_question.valid?
    assert @choice_question.order_question.valid?
  end
  test "should be valid free_question" do
    assert @free_question.valid?
    assert @free_question.order_question.valid?
  end
end
