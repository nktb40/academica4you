class CreateLnkSchoolCourses < ActiveRecord::Migration
  def change
    create_table :lnk_school_courses do |t|
      t.integer :school_id
      t.integer :course_id

      t.timestamps
    end
  end
end
