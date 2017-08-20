class CreateWeeklyWorkouts < ActiveRecord::Migration
  def change
    create_table :weekly_workouts do |t|
      t.integer :user_id
      t.integer :daily_workout_counter

      t.timestamps

    end
  end
end
