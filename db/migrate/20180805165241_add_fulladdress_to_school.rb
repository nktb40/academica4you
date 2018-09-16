class AddFulladdressToSchool < ActiveRecord::Migration[5.2]
  def change
	add_column :schools, :full_address_eng, :text
	add_column :schools, :full_address_rus, :text
	
	remove_column :schools, :latitude_old
	remove_column :schools, :longitude_old
  end
end
