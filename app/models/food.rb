class Food < ApplicationRecord
  # Direct associations

  has_many   :foods_nutritions,
             :foreign_key => "foods_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
