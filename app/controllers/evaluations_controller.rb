class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_evaluation, only: [:show, :update, :destroy]
  load_and_authorize_resource

  def index
    @evaluations = Evaluation.all
    render json: @evaluations
  end

  def show
    render json: @evaluation
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      render json: @evaluation, status: :created
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      render json: @evaluation
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @evaluation.destroy
    head :no_content
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:course_id, :user_id, :score, :feedback)
  end
end
