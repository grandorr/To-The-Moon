class CreateUserCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cryptos do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :crypto_currency, index: true

      t.timestamps
    end
  end
end
