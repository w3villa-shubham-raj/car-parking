class CreateAdminParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.integer :vehicle_id
      t.references :vehicle_type, null: false, foreign_key: true
      t.references :parking_lot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
