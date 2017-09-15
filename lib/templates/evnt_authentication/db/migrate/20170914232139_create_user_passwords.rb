# frozen_string_literal: true

# CreateUserPasswords.
class CreateUserPasswords < ActiveRecord::Migration[5.1]

  def change
    create_table :user_passwords, id: false do |t|
      t.string :user_uuid
      t.string :password_digest
    end
  end

end
