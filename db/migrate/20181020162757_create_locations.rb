class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.decimal :longitude, precision: 9, scale: 6, null: false
      t.decimal :latitude, precision: 9, scale: 6, null: false
      t.string :description
      t.string :hint
      t.string :image

      t.timestamps
    end
  end
end
