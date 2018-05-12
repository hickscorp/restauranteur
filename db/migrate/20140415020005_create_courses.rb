class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string      :name,        index:true
      t.references  :course_type, index:true
      t.references  :diet,        index:true
      t.timestamps
    end
  end
end
