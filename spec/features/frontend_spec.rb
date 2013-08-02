require 'spec_helper'

describe "frontend UI", feature: true do

  describe "featuring songs" do
    before :each do
      @songs = []
      @songs << create(Song, title: "Song B", featured_order: 3)
      @songs << create(Song, title: "Song A", featured_order: 1)
      @songs << create(Song, title: "Song C", featured_order: 2)
    end

    it "shows the songs in featured order" do
      @songs << create(Song, title: "Not Featured")
      visit "/"
      expect(page).to have_content("Song A Song C Song B")
      expect(page).to_not have_content "Not Featured"
    end
  end


end
