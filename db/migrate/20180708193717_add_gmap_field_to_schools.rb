class AddGmapFieldToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :gmaps, :boolean
  end
end
