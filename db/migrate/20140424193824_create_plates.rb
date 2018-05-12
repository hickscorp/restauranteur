class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.references :meal,         index: true
      t.references :course,       index: true
      t.string                    :name
      t.timestamps
    end
  end
end
