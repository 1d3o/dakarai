# frozen_string_literal: true

# CreateEvntEvents.
class CreateEvntEvents < ActiveRecord::Migration[5.1]

  def change
    create_table :evnt_events do |t|
      t.string :name
      t.text :payload

      t.column :created_at, :datetime
    end
  end

end
