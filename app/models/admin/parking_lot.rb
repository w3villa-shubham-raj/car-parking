class Admin::ParkingLot < ApplicationRecord
    include ParkingLotConcern
    self.table_name = "parking_lots"
    has_many :parkings

    validates :name, presence: true, uniqueness: true
    validates :max_capacity, presence: true, numericality: { greater_than: 20 }
    
   
def available_spots?(vehicle_type)
    case vehicle_type
    when "regular"
      regular_spot > 0
    when "bike"
      bike_spot > 0
    when "compact"
      compact_spot > 0
    when "large"
      large_spot > 0
    else
      false
    end
  end
    
end
