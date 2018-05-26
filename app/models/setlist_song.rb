class SetlistSong < ApplicationRecord
  belongs_to :setlist
  belongs_to :song

  acts_as_list scope: :setlist

  acts_as_taggable_on :costumes
end
