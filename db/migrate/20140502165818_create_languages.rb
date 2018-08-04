class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :eng_name
      t.string :rus_name
      t.string :original_name

      t.timestamps
    end
  end
end
