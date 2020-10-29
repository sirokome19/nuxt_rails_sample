class MakeQuestionsController < ApplicationController
  before_action :set_questionnaire, only: [:show]#, :update, :destroy]

  # GET /questionnaires
  def index
    @questionnaires =Questionnaire.all
    render json: @questionnaires
  end
    # GET /questionnaires/1
  def show
    render json: @questionnaire
  end

  # POST /questionnaires
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    if @questionnaire.save
      render json: @questionnaire, status: :created, location: make_questions_url(@questionnaire)
    else
      render json: @questionnaire.errors, status: :unprocessable_entity
    end
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
end
