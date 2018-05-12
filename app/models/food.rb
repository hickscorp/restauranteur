class Food < ActiveRecord::Base
  has_many      :components,      dependent: :destroy do
    def nutrition_facts
      facts           = {}
      self.each do |c|
        facts[c.component_type_id]  = (facts[c.component_type_id] || 0) + c.value
      end
      facts
    end
  end
end
