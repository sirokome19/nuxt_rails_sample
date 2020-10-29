require 'test_helper'

class MakeQuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:david)
    @questionnaire = questionnaires(:q1)
    # @answersheet = AnswerSheet.create(user_id:@user.id, questionnaire_id:@questionnaire.id)
    # @order_question=@questionnaire.order_questions.create()
    # @choice_question=@order_question.choice_questions.create()
    # @free_question=@order_question.free_questions.create()
    # @option=@choice_question.options.create()

    # @order_answer=@answersheet.order_answers.create(answer_sheet_id:@answersheet.id)
    # @choice_answer=@order_answer.choice_answers.new(order_answer_id:@order_answer.id, option_id:@option.id)
    # @free_answer=@order_answer.free_answers.new(order_answer_id:@order_answer.id, free_question_id:@free_question.id)
    
  end
  test "should get index" do
    get make_questions_url, as: :json
    assert_response :success
  end
  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post make_questions_url, params: { questionnaire: { abstract: @questionnaire.abstract } }, as: :json
    end
    assert_response 201
  end

  test "should show questionnaire" do
    get make_question_url(@questionnaire), as: :json
    assert_response :success
  end

  test "should update questionnaire" do
    patch make_question_url(@questionnaire), params: { questionnaire: { abstract: @questionnaire.abstract } }, as: :json
    assert_response 200
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete make_question_url(@questionnaire), as: :json
    end
    assert_response 204
  end
  
end
