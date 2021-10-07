require 'spec_helper'

describe "admin songs CRUD", type: :feature do

  before :each do
    sign_in
  end

  it "lists each song" do
    create :song, title: "B Song"
    create :song, title: "A Song"
    visit "/admin/songs"
    expect(page).to have_content "A Song"
    expect(page).to have_content "B Song"
  end

  it "searches songs" do
    create :song, title: "Stronger"
    create :song, title: "You Are Strong"
    create :song, title: "Come Thou Fount"
    visit "/admin/songs"
    fill_in "search", with: "strong"
    click_on "Search"
    expect(page).to have_content "Stronger"
    expect(page).to have_content "You Are Strong"
    expect(page).to_not have_content "Come Thou Fount"
  end

  it "creates new songs" do
    visit "/admin/songs/new"
    fill_in "Title", with: "Stronger"
    fill_in "Scripture", with: "Test"
    fill_in "Copyright blurb", with: "©"
    click_button "Create Song"
    expect(page).to have_content "success"
    expect(page).to have_content "Stronger"
  end

  it "updates songs" do
    song = create :song, title: "A Song"
    visit "/admin/songs/#{song.id}/edit"
    fill_in "Title", with: "B Song"
    click_button "Update Song"
    expect(page).to have_content "success"
    expect(page).to have_content "B Song"
    expect(page).to_not have_content "A Song"
  end

  it "deletes songs" do
    song = create :song, title: "Song To Be Deleted"
    visit "/admin/songs"
    expect(page).to have_content "Song To Be Deleted"
    visit "/admin/songs/#{song.id}"
    click_link "Delete Song"
    visit "/admin/songs"
    expect(page).to_not have_content "Song To Be Deleted"
  end

  describe "songs with sections" do
    let(:song) { create :song, title: "Fuzzy Bunny" }

    before :each do
      create :song_section, song: song, lyrics: "Section A"
      create :song_section, song: song, lyrics: "Section B"
      create :song_section, song: song, lyrics: "Section C"
    end

    it "allow adding sections" do
      visit "/admin/songs/#{song.id}"
      click_link "Add Section"
      fill_in "Title", with: "chorus"
      fill_in "Lyrics", with: "Section D"
      click_button "Create Song section"
      expect(page).to have_content("Section D")
    end

    it "allow deleting sections" do
      visit "/admin/songs/#{song.id}"
      all("a[@title='Delete Section']").first.click
      expect(page).to_not have_content("Section A")
    end

    it "allow deleting the whole song" do
      visit "/admin/songs/#{song.id}"
      click_link "Delete Song"
      visit "/admin/songs"
      expect(page).to_not have_content("Fuzzy Bunny")
    end
  end

end
