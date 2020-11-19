class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :update, :destroy]

  # GET /questionnaires
  def index
    @questionnaires =Questionnaire.all
    render json: @questionnaires
  end
    # GET /questionnaires/1
  def show
    # orde_questions -> 配列にする
    render json: @questionnaire.as_json(
      only: [:abstract],
      include: {
        order_questions: {
          only: [:order_num],
          include:{
            choice_question:{
              only:[:text],
              include: {
                options:{
                  only:[:text, :image_url]
                }
              }
            },
            free_question:{
              only:[:text]
            }
          }
        }
      }
    )
    # render json: [@questionnaire, @questionnaire.order_questions
  end

  # POST /questionnaires
  def create
    ActiveRecord::Base.transaction do
      @questionnaire = Questionnaire.create!(questionnaire_params)
      order_questions_params.require(:order_questions).each_with_index do |question_params, idx|
        @order_question=@questionnaire.order_questions.create!(order_num: idx)
        # save each type's questions
        case question_params.require(:type)
        when "ChoiceQuestion" then
          @question=@order_question.create_choice_question!(text: question_params.require(:text))
          question_params.require(:options).each do |option_params|
            @question.options.create(option_params)
          end
        when "FreeQuestion" then
          @order_question.create_free_question!(text: question_params.require(:text))
        else
          raise RuntimeError, "undefined question type error"
        end
      end
    end
    render json: @questionnaire
  end
# PATCH/PUT /questionnaires/1
  def update
    if @questionnaire.update(questionnaire_params)
      render json: @questionnaire
    else
      render json: @questionnaire.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questionnaires/1
  def destroy
    @questionnaire.destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # # Only allow a trusted parameter "white list" through.
    def questionnaire_params
      params.require(:questionnaire).permit(:abstract)
    end
    def order_questions_params
      params.require(:questionnaire).permit(order_questions: [:type, :text, options:[:text,:image_url]])
    end
end
