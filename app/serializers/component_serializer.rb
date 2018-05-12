class ComponentSerializer < ActiveModel::Serializer
  attributes    :id, :component_type_id, :value
end
