class CreateResidenceDurations < ActiveRecord::Migration[5.2]
  def change
    create_table :residence_durations do |t|
      t.string :residence_id
      t.integer :duration
      t.string :type
      t.float :price
      t.integer :currency_id

      t.timestamps
    end
  end
end
