class Food < ApplicationRecord
  # Direct associations

  has_many   :favorite_foods,
             :foreign_key => "foods_id",
             :dependent => :destroy

  has_many   :foods_nutritions,
             :foreign_key => "foods_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
