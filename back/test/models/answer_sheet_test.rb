require 'test_helper'

class AnswerSheetTest < ActiveSupport::TestCase
  def setup
    @user=User.create()
    @questionnaire = Questionnaire.create()
    @answersheet = AnswerSheet.create(user_id:@user.id, questionnaire_id:@questionnaire.id)
  end

  test "should be valid" do
    assert @answersheet.valid?
    user2=User.create()
    questionnaire2 = Questionnaire.create()
    answersheet2=AnswerSheet.new(user_id:user2.id, questionnaire_id:@questionnaire.id)
    assert answersheet2.save
    answersheet3=AnswerSheet.new(user_id:@user.id, questionnaire_id:questionnaire2.id)
    assert answersheet3
  end

  test "should be unique to user_id and questionnaire" do
    answersheet2=AnswerSheet.new(user_id:@user.id, questionnaire_id:@questionnaire.id)
    assert_not answersheet2.save
  end
end
