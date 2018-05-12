class PlateSerializer < ActiveModel::Serializer
  attributes    :id, :name, :meal_id, :course_id, :course_type_id
  def course_type_id
    object && object.course ? object.course.course_type_id : nil
  end
end
