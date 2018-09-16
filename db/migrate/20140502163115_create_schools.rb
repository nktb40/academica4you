class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :description
      t.integer :company_id
      t.integer :address_id

      t.timestamps
    end
  end
end
