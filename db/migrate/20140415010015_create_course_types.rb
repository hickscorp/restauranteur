class CreateCourseTypes < ActiveRecord::Migration
  def change
    create_table :course_types do |t|
      t.string :name, index:true
      t.timestamps
    end
  end
end
