require 'test_helper'

class QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  def setup
    # questionnaire*1
    # |-choice_question
    # --free_question
    # user*2
    @david=users(:david)
    @steve=users(:steve)
    @questionnaire = questionnaires(:q1)
    @david_answer = answer_sheets(:as1)
    @steve_answer = answer_sheets(:as2)
    @order_question = order_questions(:oq1)
    @choice_question = questions(:cq1)
    @free_question = questions(:fq1)
    @option1 = options(:o1)
    @option2 = options(:o2)

    @david_order_1=order_answers(:oa1)
    @david_order_2=order_answers(:oa2)
    @steve_order_1=order_answers(:oa3)
    @steve_order_2=order_answers(:oa4)
    @david_choice_answer=answers(:ca1)
    @david_free_answer=answers(:fa1)
    @steve_choice_answer=answers(:ca2)
    @steve_free_answer=answers(:fa2)    
  end
  test "should get index" do
    get questionnaires_url, as: :json
    assert_response :success
  end
  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post questionnaires_url, params: {
        questionnaire: {
        abstract: @questionnaire.abstract,
        order_questions:[{
          type:"FreeQuestion",
          text:"hoge"
        }]
        }
      }, as: :json
    end
    assert_response 201
  end

  test "should show questionnaire" do
    get questionnaire_url(@questionnaire), as: :json
    assert_response :success
  end

  test "should update questionnaire" do
    patch questionnaire_url(@questionnaire), params: { questionnaire: { abstract: @questionnaire.abstract } }, as: :json
    assert_response 200
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete questionnaire_url(@questionnaire), as: :json
    end
    assert_response 204
  end
  
end
