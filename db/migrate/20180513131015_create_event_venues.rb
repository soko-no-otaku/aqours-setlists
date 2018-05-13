class CreateEventVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :event_venues do |t|
      t.references :event, foreign_key: true
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
