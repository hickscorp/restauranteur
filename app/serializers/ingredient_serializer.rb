class IngredientSerializer < ActiveModel::Serializer
  attributes    :id, :food_id, :quantity
  attributes    :food_name
  def food_name
    object.food && object.food.name || ''
  end
end
