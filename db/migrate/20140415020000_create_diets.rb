class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.references    :user,      index:true
      t.string        :name,      index:true
      t.timestamps
    end
  end
end
