class CourseType < ActiveRecord::Base
  has_many        :courses,  dependent: :destroy
  has_many        :plates
end
