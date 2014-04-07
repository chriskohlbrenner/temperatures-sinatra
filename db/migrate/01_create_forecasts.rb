class CreateForecasts < ActiveRecord::Migration
  def up
    create_table :forecasts do |t|
      t.string :temperature
      t.string :location
      t.string :zipcode
      t.string :high_tomorrow
      t.string :low_tomorrow
      t.timestamps
    end
  end

  def down
    drop_table :forecasts
  end
end