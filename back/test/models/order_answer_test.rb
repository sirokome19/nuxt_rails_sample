require 'test_helper'

class OrderAnswerTest < ActiveSupport::TestCase
  def setup
    @user=User.create()
    @questionnaire = Questionnaire.create()
    @answersheet = AnswerSheet.create(user_id:@user.id, questionnaire_id:@questionnaire.id)
    @order_answer=@answersheet.order_answers.new(order_num:0)
  end
  test "should be valid" do
    assert @order_answer.valid?
    assert @order_answer.save
  end
end
