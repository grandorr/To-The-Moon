class AddHasBeanReadToComment < ActiveRecord::Migration[5.2]
  def change
      add_column :comments, :has_been_read, :boolean
  end
end
