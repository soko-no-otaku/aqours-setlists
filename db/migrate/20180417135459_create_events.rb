class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :started_at, null: false

      t.timestamps
    end
  end
end
