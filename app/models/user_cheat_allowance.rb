class UserCheatAllowance < ApplicationRecord
  # Direct associations

  belongs_to :foodscatagory,
             :class_name => "FoodsCatagory"

  belongs_to :user

  # Indirect associations

  # Validations

end
