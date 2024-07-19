class ReclamationsController < ApplicationController
  before_action :set_reclamation, only: [:show, :update, :destroy]

  def index
    @reclamations = Reclamation.all
    render json: @reclamations
  end

  def show
    render json: @reclamation
  end

  def create
    @reclamation = Reclamation.new(reclamation_params)
    if @reclamation.save
      render json: @reclamation, status: :created
    else
      render json: @reclamation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reclamation.update(reclamation_params)
      render json: @reclamation
    else
      render json: @reclamation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reclamation.destroy
    head :no_content
  end

  private

  def set_reclamation
    @reclamation = Reclamation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Reclamation not found' }, status: :not_found
  end

  def reclamation_params
    params.require(:reclamation).permit(:object, :description, :nom, :cours)
  end
end

