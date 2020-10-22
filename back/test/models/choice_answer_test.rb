require 'test_helper'

class ChoiceAnswerTest < ActiveSupport::TestCase
  def setup
    @user=User.create()
    @questionnaire = Questionnaire.create()
    @answersheet = AnswerSheet.create(user_id:@user.id, questionnaire_id:@questionnaire.id)
    @choice_question=@questionnaire.choice_questions.create()
    @option=@choice_question.options.create()
    @choice_answer=@answersheet.choice_answers.new(answer_sheet_id:@answersheet.id, option_id:@option.id)
    # @choice_answer=@answersheet.choice_answers.new(answer_sheet_id:@answersheet.id)
    
  end

  test "should be valid" do
    assert @choice_answer.valid?
    assert @choice_answer.save
  end
end
