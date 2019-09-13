class ChangeQuantityToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :user_cryptos, :quantity, :float
  end
end
