class CreateResidenceFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :residence_features do |t|
      t.integer :residence_id
      t.string :name
      t.text :description
      t.float :price
      t.integer :currency_id

      t.timestamps
    end
  end
end
