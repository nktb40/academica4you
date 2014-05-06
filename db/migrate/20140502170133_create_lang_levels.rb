class CreateLangLevels < ActiveRecord::Migration
  def change
    create_table :lang_levels do |t|
      t.string :name
      t.text :description
      t.integer :language_id

      t.timestamps
    end
  end
end
