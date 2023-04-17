module ParkingLotConcern
    
    def max_capacity
       ( bike_spot) + (regular_spot * 3) + (compact_spot * 2) + (large_spot * 9)
    end

    def remaining_space
        remaining_spot = max_capacity
        vehicle_space = Admin::VehicleType.pluck(:id, :required_space).to_h
        park_vehicles = parkings.where(parkout_time: nil).pluck(:vehicle_type_id)
        park_vehicles.each do |vehicle_type_id|
            remaining_spot -= vehicle_space[vehicle_type_id]
        end
        return remaining_spot
    end


    def full?
        remaining_space == 0 ? true : false
    end

    def empty?
        remaining_space < max_capacity ? false : true
    end

    def remaining_bike_spot
        bike_spot - Admin::Parking.joins(:vehicle_type).where(vehicle_type: {name: 'bike'}, parkout_time: nil).size
    end

    def remaning_compact_spot
         compact_spot - Admin::Parking.joins(:vehicle_type).where(vehicle_type: {name: 'compact'}, parkout_time: nil).size
    end

    def remaning_regular_space
        regular_spot - Admin::Parking.joins(:vehicle_type).where(vehicle_type: {name: 'regular'}, parkout_time: nil).size
    end

    def remaining_large_spot
        large_spot - Admin::Parking.joins(:vehicle_type).where(vehicle_type: {name: 'large'}, parkout_time: nil).size
    end

    def bike_spot_full?
        remaining_bike_spot == 0 ? true : false
    end

    def compact_spot_full?
        remaining_compact_spot == 0 ? true : false
    end

    def regular_spot_full?
        remaining_regular_spot == 0 ? true : false
    end

    def large_spot_full?
        remaining_large_spot == 0 ? true : false
    end

    def bike_spot_empty?
       remaining_bike_spot > 0 ? true : false
    end
    
    def compact_spot_empty?
        remaining_compact_spot > 0 ? true : false
    end
    def regular_spot_empty?
        remaining_regular_spot > 0 ? true : false
    end
    def large_spot_empty?
        remaining_large_spot > 0 ? true : false
    end
    
end