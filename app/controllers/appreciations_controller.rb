class AppreciationsController < ApplicationController
  before_action :set_appreciation, only: [:show, :update, :destroy]

  def index
    @appreciations = Appreciation.all
    render json: @appreciations
  end

  def show
    render json: @appreciation
  end

  def create
    @appreciation = Appreciation.new(appreciation_params)
    if @appreciation.save
      render json: @appreciation, status: :created
    else
      render json: @appreciation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @appreciation.update(appreciation_params)
      render json: @appreciation
    else
      render json: @appreciation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appreciation.destroy
    head :no_content
  end

  private

  def set_appreciation
    @appreciation = Appreciation.find(params[:id])
  end

  def appreciation_params
    params.require(:appreciation).permit(:notes, :appreciation, :nom, :cours)
  end
end

