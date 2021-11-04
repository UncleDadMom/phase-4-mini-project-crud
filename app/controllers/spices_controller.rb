class SpicesController < ApplicationController
  before_action :set_spice, only: [:show, :update, :destroy]

  # GET /spices
  def index
    @spices = Spice.all

    render json: @spices
  end

  def show
    spice = set_spice
    render json: spice
  end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    if spice
      render json: spice, status: :created
    else
      render json: spice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spices/1
  def update
    if @spice.update(spice_params)
      render json: @spice
    else
      render json: @spice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spices/1
  def destroy
    @spice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spice
      @spice = Spice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
end
