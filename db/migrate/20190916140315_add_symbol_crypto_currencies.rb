class AddSymbolCryptoCurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :crypto_currencies, :symbol, :string
  end
end
