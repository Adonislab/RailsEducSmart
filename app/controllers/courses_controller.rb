class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :update, :destroy]
  load_and_authorize_resource

  def index
    render json: @courses
  end

  def show
    render json: @course
  end

  def create
    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    head :no_content
  end

  private

  def course_params
    params.require(:course).permit(:name, :start_time, :end_time, :user_id, :categories_id )
  end
end
