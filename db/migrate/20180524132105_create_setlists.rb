class CreateSetlists < ActiveRecord::Migration[5.1]
  def change
    create_table :setlists do |t|
      t.datetime :started_at
      t.string :day_n
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
