class FoodsNutrition < ApplicationRecord
  # Direct associations

  belongs_to :foodscatagory,
             :class_name => "FoodsCatagory"

  belongs_to :foods,
             :class_name => "Food"

  # Indirect associations

  # Validations

end
