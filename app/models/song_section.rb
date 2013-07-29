class SongSection < ActiveRecord::Base
  belongs_to :song

  validates_presence_of :title, :song_id
end
