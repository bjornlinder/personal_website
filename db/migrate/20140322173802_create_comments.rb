class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.text :message
      t.timestamps
    end
   end

  def self.down
    drop_table :comments
   end
end
