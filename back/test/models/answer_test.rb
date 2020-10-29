require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @user=User.create()
    @questionnaire = Questionnaire.create()
    @answersheet = AnswerSheet.create(user_id:@user.id, questionnaire_id:@questionnaire.id)
    @order_question=@questionnaire.order_questions.create(order_num:0)
    @choice_question=@order_question.choice_questions.create()
    @free_question=@order_question.free_questions.create()
    @option=@choice_question.options.create()

    @order_answer=@answersheet.order_answers.create(order_num:0,answer_sheet_id:@answersheet.id)
    @choice_answer=@order_answer.choice_answers.new(order_answer_id:@order_answer.id, option_id:@option.id)
    @free_answer=@order_answer.free_answers.new(order_answer_id:@order_answer.id, free_question_id:@free_question.id)
    
  end

  test "should be valid choice answer" do
    assert @choice_answer.valid?
    assert @choice_answer.save
  end
  test "should be valid free answer" do
    assert @free_answer.valid?
    assert @free_answer.save
  end
end