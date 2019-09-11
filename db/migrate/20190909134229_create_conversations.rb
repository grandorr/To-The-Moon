class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
    	t.belongs_to :user, index: true
    	t.references :interlocutor, index: true
      t.timestamps
    end
  end
end
