require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @user=User.create()
    @questionnaire = Questionnaire.create()
    @answersheet = AnswerSheet.create(user_id:@user.id, questionnaire_id:@questionnaire.id)
    @answer=@answersheet.answers.new()
  end

  test "should be valid" do
    assert @answer.valid?
  end
end