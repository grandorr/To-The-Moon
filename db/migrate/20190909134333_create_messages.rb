class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
    	t.text :content
    	t.boolean :has_been_read
    	t.belongs_to :conversation, index: true
    	t.references :recipient, index: true
    	t.references :sender, index: true
      t.timestamps
    end
  end
end
