class Ingredient < ActiveRecord::Base
  belongs_to    :plate
  belongs_to    :food
  has_many      :components,  through: :food
end
