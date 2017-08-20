class DailyWorkout < ApplicationRecord
  # Direct associations

  belongs_to :weeklyworkout,
             :class_name => "WeeklyWorkout"

  belongs_to :user

  # Indirect associations

  # Validations

end
