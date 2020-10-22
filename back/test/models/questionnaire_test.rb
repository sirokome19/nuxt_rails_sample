require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @questionnaire = Questionnaire.new()
  end

  test "should be valid" do
    assert @questionnaire.valid?
  end
end
