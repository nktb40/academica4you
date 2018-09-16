class CreateGeoplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :geoplaces do |t|
    	t.string 	:geoplace_type_id
      	t.string 	:long_name
      	t.string 	:short_name
      	t.text 		:formatted_address
      	t.integer 	:parent_geoplace_id
      	t.string 	:parent_geoplace_type_id
      	t.float 	:latitude
      	t.float 	:longitude
      	t.float 	:northeast_lat
      	t.float 	:northeast_lng
      	t.float 	:southwest_lat
      	t.float 	:southwest_lng
      	t.timestamps
    end
  end
end
