require 'spec_helper'

describe "frontend UI", type: :feature do

  after :each do
    page.driver.options[:headers] = {}
  end

  before :each do
    @songs = []
    @songs << create(:song, title: "Song B", featured_order: 3)
    @songs << create(:song, title: "Song A", featured_order: 1)
    @songs << create(:song, title: "Song C", featured_order: 2)
    @songs << create(:song, title: "Not Featured")
  end

  describe "access control" do
    it "blocks public Internet addresses" do
      page.driver.options[:headers] = { 'REMOTE_ADDR' => "66.67.68.69" }
      visit "/"
      expect(page).to_not have_content("Song A")
      expect(page).to have_content("Blocked")
    end

    it "allows local addresses" do
      [
        "10.10.0.30", "192.168.1.10", "127.0.0.1"
      ].each do |addr|
        page.driver.options[:headers] = { 'REMOTE_ADDR' => addr }
        visit "/"
        expect(page).to_not have_content("Blocked")
      end
    end
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
      song = create :song, title: "Stronger"
      create :song_section, song: song
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
