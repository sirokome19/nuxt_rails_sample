class AnswerQuestionsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    answer_sheets = AnswerSheet.all()
    render json: { status: 'SUCCESS', message: 'Loaded answer_sheets', data: answer_sheets }
  end

  def show
    # show questions(questionnaire detail)
    render json: { status: 'SUCCESS', message: 'Loaded the answer_sheet', data: @questionnaire }
  end

  def create
    # answer question

    # post = Post.new(post_params)
    # if post.save
    #   render json: { status: 'SUCCESS', data: post }
    # else
    #   render json: { status: 'ERROR', data: post.errors }
    # end
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
    @questionnaire = @answer_sheet.questionnaire
  end

  def post_params
    params.require(:post).permit(:title)
  end
end