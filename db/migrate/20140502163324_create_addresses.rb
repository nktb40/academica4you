class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :world_part
      t.string :country
      t.string :region
      t.string :city
      t.string :street
      t.string :house
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
