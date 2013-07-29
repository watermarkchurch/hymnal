class Song < ActiveRecord::Base
  has_many :song_sections

  validates_presence_of :title
end
