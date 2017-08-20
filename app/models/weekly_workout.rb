class WeeklyWorkout < ApplicationRecord
  # Direct associations

  has_many   :daily_workouts,
             :foreign_key => "weeklyworkout_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
