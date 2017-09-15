# frozen_string_literal: true

# CreateUsers.
class CreateUsers < ActiveRecord::Migration[5.1]

  def change
    create_table :users, id: false do |t|
      t.string :uuid, primary: true

      t.string :name
      t.string :surname
      t.string :email
      t.boolean :email_confirmed
    end
  end

end
