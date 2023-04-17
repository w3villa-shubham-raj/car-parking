module ApplicationHelper

    def vehicle_type_name(vehicle_id)
        Admin::VehicleType.find_by_id(vehicle_id).name
    end

    def parking_lot_name(parking_lot_id)
         Admin::ParkingLot.find_by_id(parking_lot_id).name
       

    end

 

end
