class AnswerSheetsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    answer_sheets = AnswerSheet.all()
    render json:answer_sheets
  end

  def show
    # show questions(questionnaire detail)
    render json: @answer_sheet.as_json(
      include: {
        order_answers: {
          only: [:order_num],
          include:{
            choice_answer:{
              include: {
                option:{
                  only:[:text, :image_url],
                  include:{
                    choice_question:{
                      only:[:text]
                    }
                  }
                }
              }
            },
            free_answer:{
              only:[:text],
              include: {
                free_question:{
                  only:[:text]
                }
              }
            }
          }
        }
      }
    )
  end

  def create
    # answer question
    ActiveRecord::Base.transaction do
      answer_sheet=AnswerSheet.create!(answer_sheet_params)
      order_answers_params.require(:order_answers).each_with_index do |answer_params, idx|
        order_answer=answer_sheet.order_answers.create!(order_num: idx)
        case answer_params.require(:type)
        when "ChoiceAnswer" then
          answer=order_answer.create_choice_answer(option_id: answer_params.require(:option_id))
        when "FreeAnswer" then
          print(answer_params.require(:free_question_id))
          order_answer.create_free_answer!(text: answer_params.require(:text), free_question_id: answer_params.require(:free_question_id))
        else
          raise RuntimeError, "undefined answer type error"
        end
      end
    end
  end

  def destroy
    # @post.destroy
    # render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
  end

  def update
    # if @post.update(post_params)
    #   render json: { status: 'SUCCESS', message: 'Updated the post', data: @post }
    # else
    #   render json: { status: 'SUCCESS', message: 'Not updated', data: @post.errors }
    # end
  end

  private

  def set_post
    @answer_sheet = AnswerSheet.find(params[:id])
  end

  def answer_sheet_params
    params.require(:answer_sheet).permit(:user_id, :questionnaire_id)
  end
  def order_answers_params
    params.require(:answer_sheet).permit(order_answers: [:type, :text, :option_id, :free_question_id])
  end
end