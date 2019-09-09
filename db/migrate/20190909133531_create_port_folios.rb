class CreatePortFolios < ActiveRecord::Migration[5.2]
  def change
    create_table :port_folios do |t|

      t.timestamps
    end
  end
end
