class CreateDailyWorkouts < ActiveRecord::Migration
  def change
    create_table :daily_workouts do |t|
      t.date :workout_date
      t.boolean :dailyworkout_check
      t.integer :user_id
      t.integer :weeklyworkout_id

      t.timestamps

    end
  end
end
