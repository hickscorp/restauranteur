class Course < ActiveRecord::Base
  belongs_to    :diet
  belongs_to    :course_type
  has_many      :constraints,  dependent: :destroy
end
