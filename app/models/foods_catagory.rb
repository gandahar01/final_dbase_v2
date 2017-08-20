class FoodsCatagory < ApplicationRecord
  # Direct associations

  has_many   :foods_nutritions,
             :foreign_key => "foodscatagory_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
