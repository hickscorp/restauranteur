class ConstraintSerializer < ActiveModel::Serializer
  attributes    :id, :component_type_id, :minimum_value, :maximum_value
end
