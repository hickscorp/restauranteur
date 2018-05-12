class CreateUsers < ActiveRecord::Migration
  def change
    create_table    :users do |t|
      t.string      :email
      t.string      :first_name
      t.string      :last_name
      t.binary      :password_digest
      t.string      :password_reset_token
      t.datetime    :password_reset_sent_at
      t.string      :remember_token
      t.integer     :roles_mask
      t.timestamps
    end
    add_index       :users, :email,         unique: true
    add_index       :users, :remember_token
  end
end
