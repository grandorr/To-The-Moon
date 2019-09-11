class CreateCryptoCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :crypto_currencies do |t|
      t.string :name
      t.string :crypto_id
      t.timestamps
    end
  end
end
