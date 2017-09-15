class CreateUserPasswords < ActiveRecord::Migration[5.1]
  def change
    create_table :user_passwords do |t|
      t.integer :user_id
      t.string :password_digest
    end
  end
end
