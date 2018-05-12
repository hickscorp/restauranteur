class CourseSerializer < ActiveModel::Serializer
  attributes    :id, :name, :diet_id, :course_type_id
end
