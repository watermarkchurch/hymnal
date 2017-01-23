class SongSection < ActiveRecord::Base
  belongs_to :song

  validates_presence_of :title, :song_id

  before_save :set_position_to_end_of_song, if: -> { ordered_by.blank? || ordered_by.zero? }

  def set_position_to_end_of_song
    self.ordered_by = highest_song_ordered_by + 1
  end

  private

  def highest_song_ordered_by
    self.class.where(song: song).pluck(:ordered_by).max || 0
  end

end
