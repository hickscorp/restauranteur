class CreateComponentTypes < ActiveRecord::Migration
  def change
    create_table :component_types do |t|
      t.string      :name,    index: true
      t.string      :code,    index: true
      t.string      :unit
    end
  end
end
