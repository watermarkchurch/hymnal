require 'spec_helper'

describe SongSection do
  it { should belong_to :song }
  it { should validate_presence_of :title }
  it { should validate_presence_of :song_id }

  let(:song) { create Song }

  describe ":ordered_by column" do
    it "is placed at the bottom of the song if nil" do
      create SongSection, song: song, ordered_by: 3
      last_item = create SongSection, song: song
      expect(last_item.ordered_by).to eq(4)
    end
  end
end
