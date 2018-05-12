class Meal < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :diet
  has_many      :plates,  dependent:  :destroy
  after_create  do
    courses       = self.diet.courses
    courses.each do |course|
      self.plates.create({
        course:     course,
        name:       course.name
      })
    end
  end
end
