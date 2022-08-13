class SpicesController < ApplicationController
  
  # GET /spices
  def index
    spices = Spice.all
    render json: spices
  end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  # PATCH /spices/:id
  def update
    spice = Spice.find(params[:id])
    spice.update(spice_params)
    render json: spice, exclude: [:created_at, :updated_at]
  end

  # DESTROY /spices/:id
  def destroy
    spice = Spice.find(params[:id])
    spice.destroy
    head :no_content
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end