class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :food_name
      t.string :food_description

      t.timestamps

    end
  end
end
