class Admin::VehicleTypesController < Admin::ApplicationController 
  before_action :set_admin_vehicle_type, only: %i[ show edit update destroy ]

  def index
    @admin_vehicle_types = Admin::VehicleType.all
  end

  def show
  end

  def new
    @admin_vehicle_type = Admin::VehicleType.new
  end

  def edit
  end

  def create
    @admin_vehicle_type = Admin::VehicleType.new(admin_vehicle_type_params)
    respond_to do |format|
      if @admin_vehicle_type.save
        format.html { redirect_to admin_vehicle_type_url(@admin_vehicle_type), notice: "Vehicle type was successfully created." }
        format.json { render :show, status: :created, location: @admin_vehicle_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_vehicle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_vehicle_type.update(admin_vehicle_type_params)
        format.html { redirect_to admin_vehicle_type_url(@admin_vehicle_type), notice: "Vehicle type was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_vehicle_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_vehicle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_vehicle_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_vehicle_types_url, notice: "Vehicle type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_vehicle_type
      @admin_vehicle_type = Admin::VehicleType.find(params[:id])
    end

    def admin_vehicle_type_params
      params.require(:admin_vehicle_type).permit(:name, :required_space)
    end
end
