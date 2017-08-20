class CreateFoodsNutritions < ActiveRecord::Migration
  def change
    create_table :foods_nutritions do |t|
      t.integer :foods_id
      t.integer :foodscatagory_id
      t.integer :foods_calories
      t.integer :foods_carbs
      t.integer :foods_fat
      t.integer :foods_sugar

      t.timestamps

    end
  end
end
