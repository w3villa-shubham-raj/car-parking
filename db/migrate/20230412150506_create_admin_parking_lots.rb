class CreateAdminParkingLots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_lots do |t|
      t.string :name
      t.integer :bike_spot , default: 0 , nil: false
      t.integer :compact_spot , default: 0 , nil: false
      t.integer :regular_spot , default: 0 , nil: false
      t.integer :large_spot , default: 0 , nil: false


      t.timestamps
    end
  end
end
