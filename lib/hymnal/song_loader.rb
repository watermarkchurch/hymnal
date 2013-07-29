class Hymnal::SongLoader
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def save
    songs.each do |song|
      song = song.with_indifferent_access
      song_record = Song.new(
        title: song[:title],
        scripture: song[:scripture],
        copyright_blurb: song[:copyright_blurb]
      )
      song_record.save!
      song[:sections].each do |section|
        section = section.with_indifferent_access
        song_record.song_sections.create!(
          title: section[:title],
          lyrics: section[:lyrics]
        )
      end
    end
  end

  private

  def songs
    @songs ||= YAML.load_file(file_name)
  end

end
