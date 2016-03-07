class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title, null: false
      t.string :media
      t.text :body
      t.date :date_created
      t.string :preview_media
      t.text :preview_text
      t.string :path

      t.timestamps
    end
   end

  def self.down
    drop_table :posts
   end
end
