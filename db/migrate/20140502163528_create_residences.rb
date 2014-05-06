class CreateResidences < ActiveRecord::Migration
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
