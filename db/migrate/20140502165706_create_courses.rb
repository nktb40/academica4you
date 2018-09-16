class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :language_id
      t.integer :level_id
      t.integer :minimum_age

      t.timestamps
    end
  end
end
