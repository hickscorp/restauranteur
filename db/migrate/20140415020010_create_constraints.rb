class CreateConstraints < ActiveRecord::Migration
  def change
    create_table :constraints do |t|
      t.references  :component_type,      index:true
      t.references  :course,              index: true
      t.float       :minimum_value
      t.float       :maximum_value

      t.timestamps
    end
  end
end
