require 'spec_helper'

describe SongSection do
  it { should belong_to :song }
  it { should validate_presence_of :title }
  it { should validate_presence_of :song_id }
end
