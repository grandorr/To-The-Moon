class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
    	t.references :interested_user, index: true
    	t.references :favorite_article, index: true
      t.timestamps
    end
  end
end
