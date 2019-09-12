class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
    	t.belongs_to :user
    	t.belongs_to :comment
    	t.belongs_to :article
      t.timestamps
    end
  end
end
