class ComponentType < ActiveRecord::Base
  has_many    :components,  dependent: :destroy
  has_many    :foods,       through: :components
end
