class Admin::Parking < ApplicationRecord
  self.table_name = "parkings"
  belongs_to :vehicle_type
  belongs_to :parking_lot

   validates_presence_of :vehicle_type_id, :parking_lot_id
  validate :available_spots, on: :create

  before_create :update_record

  private

  def available_spots
    unless parking_lot.available_spots?(vehicle_type.name)
      errors.add(:base, "No available spots in parking lot with ID #{self.parking_lot_id}")
    end
  end

  def update_record
    # Retrieve the associated vehicle type and parking lot
    vehicle_type = VehicleType.find_by_id(self.vehicle_type_id)
    parking_lot = ParkingLot.find_by_id(self.parking_lot_id)

    # Check that the vehicle type and parking lot exist in the database
    if vehicle_type.nil?
      errors.add(:base, "Vehicle type with ID #{self.vehicle_type_id} not found")
    end

    if parking_lot.nil?
      errors.add(:base, "Parking lot with ID #{self.parking_lot_id} not found")
    end

    # Decrement the appropriate spot count based on the type of vehicle
    if vehicle_type.name == "regular"
      if parking_lot.regular_spot > 0
        parking_lot.decrement(:regular_spot, 1)
        parking_lot.save
        # additional logic for regular spot
      else
        errors.add(:base, "No regular spots available in parking lot with ID #{self.parking_lot_id}")
      end
    elsif vehicle_type.name == "bike"
      if parking_lot.bike_spot > 0
        parking_lot.decrement(:bike_spot, 1)
        parking_lot.save
        # additional logic for bike spot
      else
        errors.add(:base, "No bike spots available in parking lot with ID #{self.parking_lot_id}")
      end
    elsif vehicle_type.name == "compact"
      if parking_lot.compact_spot > 0
        parking_lot.decrement(:compact_spot, 1)
        parking_lot.save
        # additional logic for compact spot
      else
        errors.add(:base, "No compact spots available in parking lot with ID #{self.parking_lot_id}")
      end
    elsif vehicle_type.name == "large"
      if parking_lot.large_spot > 0
        parking_lot.decrement(:large_spot, 1)
        parking_lot.save
        # additional logic for large spot
      else
        errors.add(:base, "No large spots available in parking lot with ID #{self.parking_lot}")
      end
    end
  end
end
