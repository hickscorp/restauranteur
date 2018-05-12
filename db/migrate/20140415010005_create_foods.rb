class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :external_id, index: true
      t.string :name, index: true
    end
  end
end
