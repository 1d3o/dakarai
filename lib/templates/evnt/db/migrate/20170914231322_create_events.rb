# frozen_string_literal: true

# CreateEvnt.
class CreateEvnt < ActiveRecord::Migration[5.1]

  def change
    create_table :evnts do |t|
      t.string :name
      t.text :payload

      t.column :created_at, :datetime
    end
  end

end
