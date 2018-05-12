class Plate < ActiveRecord::Base
  belongs_to    :course
  belongs_to    :meal
  has_many      :ingredients, dependent: :destroy do
    def nutrition_facts
      facts           = {}
      self.includes(:components).each do |i|
        i.components.each do |c|
          facts[c.component_type_id]  = (facts[c.component_type_id] || 0) + i.quantity/100.0*c.value
        end
      end
      facts
    end
  end
end
