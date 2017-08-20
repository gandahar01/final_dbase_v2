class CreateUserCheatAllowances < ActiveRecord::Migration
  def change
    create_table :user_cheat_allowances do |t|
      t.integer :cheat_calories
      t.integer :cheat_carbs
      t.integer :cheat_fat
      t.integer :cheat_sugar
      t.date :week_date
      t.integer :user_id
      t.integer :foodscatagory_id

      t.timestamps

    end
  end
end
