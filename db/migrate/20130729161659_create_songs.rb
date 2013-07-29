class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :scripture
      t.string :copyright_blurb
      t.integer :featured_order

      t.timestamps
    end
  end
end
