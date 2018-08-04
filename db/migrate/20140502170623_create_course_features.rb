class CreateCourseFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :course_features do |t|
      t.integer :course_id
      t.string :name
      t.text :description
      t.float :price
      t.integer :currency_id

      t.timestamps
    end
  end
end
