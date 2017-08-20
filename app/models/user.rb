class User < ApplicationRecord
  # Direct associations

  has_many   :daily_workouts,
             :dependent => :destroy

  has_many   :favorite_foods,
             :dependent => :destroy

  has_many   :user_cheat_allowances,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
