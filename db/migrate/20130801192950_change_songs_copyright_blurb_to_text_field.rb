class ChangeSongsCopyrightBlurbToTextField < ActiveRecord::Migration
  def change
    change_column :songs, :copyright_blurb, :text
  end
end
