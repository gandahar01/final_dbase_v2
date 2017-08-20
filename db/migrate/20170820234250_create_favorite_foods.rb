class CreateFavoriteFoods < ActiveRecord::Migration
  def change
    create_table :favorite_foods do |t|
      t.string :favoritefood_name
      t.integer :foods_id
      t.integer :user_id

      t.timestamps

    end
  end
end
