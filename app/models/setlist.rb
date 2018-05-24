class Setlist < ApplicationRecord
  belongs_to :event

  has_many :setlist_songs, -> { order(position: :asc) }, inverse_of: :setlist
  has_many :songs, through: :setlist_songs
  accepts_nested_attributes_for :setlist_songs, allow_destroy: true
end
