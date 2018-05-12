class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references    :plate,     index: true
      t.references    :food,      index: true
      t.integer       :quantity
      t.timestamps
    end
  end
end
