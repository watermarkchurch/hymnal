class Song < ActiveRecord::Base
  has_many :song_sections, -> { order "ordered_by" }, dependent: :destroy

  validates_presence_of :title

  scope :alphabetical, -> { order "title" }
end
