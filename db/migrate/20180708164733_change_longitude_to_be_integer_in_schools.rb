class ChangeLongitudeToBeIntegerInSchools < ActiveRecord::Migration[5.2]
  def change
  		rename_column :schools, :latitude, :latitude_old
  		rename_column :schools, :longitude, :longitude_old
  		
  		add_column :schools, :latitude, :float, null: true
  		add_column :schools, :longitude, :float, null: true
  end
end
