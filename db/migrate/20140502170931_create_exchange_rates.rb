class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.integer :currency_1_id
      t.integer :currency_2_id
      t.float :rate
      t.integer :actual_flg
      t.integer :deleted_flg
      t.date :valid_from_dttm
      t.date :valid_to_dttm

      t.timestamps
    end
  end
end
