# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin::ParkingLot.find_or_create_by(name:"MyParking1", bike_spot: 23, compact_spot:10, regular_spot:10, large_spot: 3)
Admin::VehicleType.find_or_create_by(name:"bike",required_space:1)
Admin::VehicleType.find_or_create_by(name:"compact",required_space:2)
Admin::VehicleType.find_or_create_by(name:"regular",required_space:3)
Admin::VehicleType.find_or_create_by(name:"large",required_space:9)

# Admin::Parking.create(vehicle_id: 1, vehicle_type_id: 1, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 2, vehicle_type_id: 1, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 3, vehicle_type_id: 1, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 4, vehicle_type_id: 1, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 5, vehicle_type_id: 1, parking_lot_id: 1)

# Admin::Parking.create(vehicle_id: 6, vehicle_type_id: 2, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 7, vehicle_type_id: 2, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 8, vehicle_type_id: 2, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 9, vehicle_type_id: 2, parking_lot_id: 1)

# Admin::Parking.create(vehicle_id: 10, vehicle_type_id: 3, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 11, vehicle_type_id: 3, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 12, vehicle_type_id: 3, parking_lot_id: 1)

# Admin::Parking.create(vehicle_id: 13, vehicle_type_id: 4, parking_lot_id: 1)
# Admin::Parking.create(vehicle_id: 14, vehicle_type_id: 4, parking_lot_id: 1)

