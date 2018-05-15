class Venue < ApplicationRecord
  has_many :event_venues
  has_many :events, through: :event_venues

  geocoded_by :address
  after_validation :geocode
end
