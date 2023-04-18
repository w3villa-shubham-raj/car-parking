class Admin::ParkingLotsController < Admin::ApplicationController
  before_action :set_admin_parking_lot, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  def index
    @admin_parking_lots = Admin::ParkingLot.all
  end

  def show
  end

  def new
    @admin_parking_lot = Admin::ParkingLot.new
  end

  def edit
  end

  def create
    @admin_parking_lot = Admin::ParkingLot.new(admin_parking_lot_params)
    respond_to do |format|
      if @admin_parking_lot.save
        format.html { redirect_to admin_parking_lot_url(@admin_parking_lot), notice: "Parking lot was successfully created." }
        format.json { render :show, status: :created, location: @admin_parking_lot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_parking_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_parking_lot.update(admin_parking_lot_params)
        format.html { redirect_to admin_parking_lot_url(@admin_parking_lot), notice: "Parking lot was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_parking_lot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_parking_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_parking_lot.destroy

    respond_to do |format|
      format.html { redirect_to admin_parking_lots_url, notice: "Parking lot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_parking_lot
      @admin_parking_lot = Admin::ParkingLot.find(params[:id])
    end

    def admin_parking_lot_params
      params.require(:admin_parking_lot).permit(:name, :bike_spot, :compact_spot, :regular_spot, :large_spot)
    end
end
