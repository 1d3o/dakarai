# frozen_string_literal: true

# CreateEvents.
class CreateEvents < ActiveRecord::Migration[5.1]

  def change
    create_table :events do |t|
      t.string :name
      t.text :payload

      t.column :created_at, :datetime
    end
  end

end
