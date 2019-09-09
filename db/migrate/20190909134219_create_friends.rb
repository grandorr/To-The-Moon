class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
    	t.references :friendship_sender, index: true
    	t.references :friendship_recipient, index: true

      t.timestamps
    end
  end
end
