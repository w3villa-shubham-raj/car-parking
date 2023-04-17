class Admin::Parking < ApplicationRecord
  self.table_name = "parkings"
  belongs_to :vehicle_type
  belongs_to :parking_lot
end
