class CourseDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course_detail, only: [:show, :update, :destroy]
  load_and_authorize_resource

  def index
    @course_details = CourseDetail.all
    render json: @course_details
  end

  def show
    render json: @course_detail
  end

  def create
    @course_detail = CourseDetail.new(course_detail_params)
    if @course_detail.save
      render json: @course_detail, status: :created
    else
      render json: @course_detail.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course_detail.update(course_detail_params)
      render json: @course_detail
    else
      render json: @course_detail.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course_detail.destroy
    head :no_content
  end

  private

  def set_course_detail
    @course_detail = CourseDetail.find(params[:id])
  end

  def course_detail_params
    params.require(:course_detail).permit(:course_id, :content, :video, :audio)
  end
end
