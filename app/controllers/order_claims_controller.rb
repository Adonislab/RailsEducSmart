class OrderClaimsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_claims, only: [:show, :update, :destroy]
  load_and_authorize_resource

  def index
    @order_claims = Order_claims.all
    render json: @order_claims
  end

  def show
    render json: @order_claims
  end

  def create
    @order_claims = Order_claims.new(evaluation_params)
    if @order_claims.save
      render json: @order_claims, status: :created
    else
      render json: @order_claims.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order_claims.update(evaluation_params)
      render json: @order_claims
    else
      render json: @order_claims.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order_claims.destroy
    head :no_content
  end

  private

  def set_order_claims
    @order_claims = Order_claims.find(params[:id])
  end

  def order_claims_params
    params.require(:order_claims).permit(:claim_type, :description, :status, :users_id)
  end
end
