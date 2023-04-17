class AddColumnParkoutTimeToParkings < ActiveRecord::Migration[7.0]
  def change
    add_column :parkings, :parkout_time, :datetime
  end
end
