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
              only:[],
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
    @questionnaire = Questionnaire.new(questionnaire_params)
    if @questionnaire.save
      idx=0
      # each with index
      # こけたらrollbackできるようにする
      # database側でtransaction単位にできる
      for question_params in order_questions_params.require(:order_questions) do
        @order_question=@questionnaire.order_questions.new(order_num: idx)
        if @order_question.save
          idx+=1
          # save each type's questions
          case question_params.require(:type)
          when "ChoiceQuestion" then
            @question=@order_question.build_choice_question
            if @question.save
              for option_params in question_params.require(:options) do
                @question.options.create(option_params)
              end
            end
          when "FreeQuestion" then
            @order_question.create_free_question(text: question_params.require(:text))
          else
            print("undefined type error")
          end
        end
      end
    end
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
