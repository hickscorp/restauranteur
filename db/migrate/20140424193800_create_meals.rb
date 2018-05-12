class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.references  :user,  index: true
      t.references  :diet,  index: true
      t.string      :name
      t.timestamps
    end
  end
end
