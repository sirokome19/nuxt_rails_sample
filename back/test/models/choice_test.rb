require 'test_helper'

class ChoiceTest < ActiveSupport::TestCase
  def setup
    @questionnaire = Questionnaire.new()
    @choice = @questionnaire.choices.new()
  end

  test "should be valid" do
    assert @choice.valid?
    assert @choice.questionnaire.valid?
  end
end
