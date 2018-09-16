class CreateLnkSchoolGeoplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :lnk_school_geoplaces do |t|
    	t.integer	:school_id
    	t.integer	:geoplace_id 
    	t.timestamps
  	end	
  end
end
