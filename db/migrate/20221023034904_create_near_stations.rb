class CreateNearStations < ActiveRecord::Migration[5.2]
  def change
    create_table :near_stations do |t|
      t.string :train_name
      t.string :station_name
      t.string :walking_time
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
