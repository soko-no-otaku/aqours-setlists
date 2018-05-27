class RemoveStartedAtFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :started_at, :datetime
  end
end
