class CreateCourseDurations < ActiveRecord::Migration[5.2]
  def change
    create_table :course_durations do |t|
      t.integer :course_id
      t.integer :duration
      t.string :type
      t.float :price
      t.integer :currency_id

      t.timestamps
    end
  end
end
