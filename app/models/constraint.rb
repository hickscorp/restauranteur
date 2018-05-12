class Constraint < ActiveRecord::Base
  belongs_to    :component_type
  belongs_to    :course
end
