class Admin::ParkingsController < Admin::ApplicationController
  before_action :set_admin_parking, only: %i[ show edit update destroy ]

  # GET /admin/parkings or /admin/parkings.json
  def index
    @admin_parkings = Admin::Parking.all
    # @park = Admin::Parking.where(vehicle_type_id: vehicle_type.id)

  end

  # GET /admin/parkings/1 or /admin/parkings/1.json
  def show
  end

  # GET /admin/parkings/new
  def new
    @admin_parking = Admin::Parking.new
  end

  # GET /admin/parkings/1/edit
  def edit
  end

  def checkout
  vehicle_number = params[:admin_parking][:vehicle_id]
  vehicle_type_id = params[:admin_parking][:vehicle_type_id]
  parking_lot_id = params[:admin_parking][:parking_lot_id]

  # Find the parking record based on the vehicle number and vehicle type
  parking = Parking.find_by(vehicle_id: vehicle_number, vehicle_type_id: vehicle_type_id)

  # If the parking record is not found, return an error
  if parking.nil?
    flash[:error] = "Vehicle not found in parking lot."
    redirect_to admin_parkings_path and return``
  end

  # Increment the appropriate spot count based on the type of vehicle
  parking_lot = ParkingLot.find_by_id(parking_lot_id)
  if parking.vehicle_type.name == "regular"
    parking_lot.increment(:regular_spot, 1)
    # additional logic for regular spot
  elsif parking.vehicle_type.name == "bike"
    parking_lot.increment(:bike_spot, 1)
    # additional logic for bike spot
  elsif parking.vehicle_type.name == "compact"
    parking_lot.increment(:compact_spot, 1)
    # additional logic for compact spot
  elsif parking.vehicle_type.name == "large"
    parking_lot.increment(:large_spot, 1)
    # additional logic for large spot
  end
  # Save the updated parking lot and destroy the parking record
  if parking_lot.save && parking.destroy
    flash[:success] = "Vehicle has been checked out."
  else
    flash[:error] = "An error occurred while checking out the vehicle."
  end

  redirect_to admin_parkings_path
end



  # POST /admin/parkings or /admin/parkings.json
  def create
    @admin_parking = Admin::Parking.new(admin_parking_params)

    respond_to do |format|
      if @admin_parking.save
        format.html { redirect_to admin_parking_url(@admin_parking), notice: "Parking was successfully created." }
        format.json { render :show, status: :created, location: @admin_parking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/parkings/1 or /admin/parkings/1.json
  def update
    respond_to do |format|
      if @admin_parking.update(admin_parking_params)
        format.html { redirect_to admin_parking_url(@admin_parking), notice: "Parking was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_parking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/parkings/1 or /admin/parkings/1.json
  def destroy
    @admin_parking.destroy

    respond_to do |format|
      format.html { redirect_to admin_parkings_url, notice: "Parking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_parking
      @admin_parking = Admin::Parking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_parking_params
      params.require(:admin_parking).permit(:vehicle_id, :vehicle_type_id, :parking_lot_id)
    end
end
