class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :address
      t.string :url
      t.integer :capacity

      t.timestamps
    end
  end
end
