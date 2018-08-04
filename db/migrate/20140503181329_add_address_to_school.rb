class AddAddressToSchool < ActiveRecord::Migration[5.2]
  def change
  		add_column :schools, :world_part, :string
  		add_column :schools, :country, :string
  		add_column :schools, :city, :string
  		add_column :schools, :street, :string
  		add_column :schools, :house, :string
  		add_column :schools, :latitude, :string
		add_column :schools, :longitude, :string
  end
end
