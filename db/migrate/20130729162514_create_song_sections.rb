class CreateSongSections < ActiveRecord::Migration
  def change
    create_table :song_sections do |t|
      t.string :title, null: false
      t.integer :song_id, null: false
      t.integer :ordered_by, null: false, default: 0
      t.boolean :published, null: false, default: true
      t.text :lyrics

      t.timestamps
    end
    add_foreign_key :song_sections, :songs
  end
end
