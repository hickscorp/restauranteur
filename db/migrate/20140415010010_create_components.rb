class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.references  :component_type,  index: true
      t.references  :food,                  index: true
      t.float       :value
    end
  end
end
