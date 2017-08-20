class FoodsCatagory < ApplicationRecord
  # Direct associations

  has_many   :user_cheat_allowances,
             :foreign_key => "foodscatagory_id",
             :dependent => :destroy

  has_many   :foods_nutritions,
             :foreign_key => "foodscatagory_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
