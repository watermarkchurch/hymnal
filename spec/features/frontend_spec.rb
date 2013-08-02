require 'spec_helper'

describe "frontend UI", feature: true do

  before :each do
    @songs = []
    @songs << create(Song, title: "Song B", featured_order: 3)
    @songs << create(Song, title: "Song A", featured_order: 1)
    @songs << create(Song, title: "Song C", featured_order: 2)
    @songs << create(Song, title: "Not Featured")
  end

  describe "featuring songs" do
    it "shows the songs in featured order" do
      visit "/"
      expect(page).to have_content("Song A Song C Song B")
      expect(page).to_not have_content "Not Featured"
    end
  end

  describe "viewing all songs" do

    it "shows a list of all song titles" do
      visit "/songs"
      expect(page).to have_content("Not Featured Song A Song B Song C")
    end

    it "shows individual songs" do
      song = create Song, title: "Stronger"
      create SongSection, song: song
      visit "/songs"
      click_on "Stronger"
      expect(page).to have_content("ants go marching")
    end

    it "link accessible from root" do
      visit "/"
      click_on "View All Songs"
      expect(page).to have_content("Not Featured")
    end

  end

  describe "song show page" do
    it "can navigate back to song list" do
      visit "/songs/#{@songs.first.id}"
      click_on "View All Songs"
      expect(page).to have_content("Song A Song B")
    end

    it "can navigate back to featured songs" do
      visit "/songs/#{@songs.first.id}"
      click_on "Featured Songs"
      expect(page).to have_content("Song A Song C Song B")
    end
  end

  describe "song list" do
    it "can navigate back to featured songs" do
      visit "/songs"
      click_on "Featured Songs"
      expect(page).to have_content("Song A Song C Song B")
    end
  end

end
