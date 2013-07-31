require 'spec_helper'

describe "admin songs CRUD", type: :feature do

  it "lists each song" do
    create Song, title: "B Song"
    create Song, title: "A Song"
    visit "/admin/songs"
    expect(page).to have_content "A Song"
    expect(page).to have_content "B Song"
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
    song = create Song, title: "A Song"
    visit "/admin/songs/#{song.id}/edit"
    fill_in "Title", with: "B Song"
    click_button "Update Song"
    expect(page).to have_content "success"
    expect(page).to have_content "B Song"
    expect(page).to_not have_content "A Song"
  end

  it "deletes songs" do
    song = create Song, title: "Song To Be Deleted"
    visit "/admin/songs"
    expect(page).to have_content "Song To Be Deleted"
    visit "/admin/songs/#{song.id}"
    click_link "Delete Song"
    visit "/admin/songs"
    expect(page).to_not have_content "Song To Be Deleted"
  end
end
