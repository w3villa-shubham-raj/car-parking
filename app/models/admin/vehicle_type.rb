class Admin::VehicleType < ApplicationRecord
    self.table_name = "vehicle_types"
    has_many :parkings
end
