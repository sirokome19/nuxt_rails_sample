require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  def setup
    @questionnaire = Questionnaire.new()
    @choice = @questionnaire.choices.new()
    @option = @choice.options.new()
  end

  test "should be valid" do
    assert @option.valid?
    assert @option.choice.valid?
    assert @option.choice.questionnaire.valid?
  end
end
