class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :school_id
      t.integer :duration_id

      t.timestamps
    end
  end
end
