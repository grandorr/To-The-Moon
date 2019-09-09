class CreatePortFolios < ActiveRecord::Migration[5.2]
  def change
    create_table :port_folios do |t|
    	t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
