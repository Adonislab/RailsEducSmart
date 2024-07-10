class PlanningsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_planning, only: [:show, :update, :destroy]
  load_and_authorize_resource

  def index
    @plannings = Planning.all
    render json: @plannings
  end

  def show
    render json: @planning
  end

  def create
    @planning = Planning.new(planning_params)
    if @planning.save
      render json: @planning, status: :created
    else
      render json: @planning.errors, status: :unprocessable_entity
    end
  end

  def update
    if @planning.update(planning_params)
      render json: @planning
    else
      render json: @planning.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @planning.destroy
    head :no_content
  end

  private

  def set_planning
    @planning = Planning.find(params[:id])
  end

  def planning_params
    params.require(:planning).permit(:course_id, :start_time, :end_time)
  end
end
